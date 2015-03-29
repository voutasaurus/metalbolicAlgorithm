# cell.jl

# This is the main script, set up input.jl and genetics.jl then run this in Julia.

srand(0)

###### Initial Set Up ######
println("Creating Cell")


# End Condition

include("output.jl")

# Set Up Input Data Structure to be Called
# This is to be modified by the user (problem defintions)

type Molecule
	# data stored in molecule
	data 
end

# Set Up Genetics Data Structure to be Referenced
# This is to be modified by the user (problem solution)

type Gene
	# tree structure
	parent
	# protein function
	protein
	# length of protein life
	access
	# name of protein it creates
	lifetime
end


type ProteinAbundance 
	# Gene for Protein
	gene
	# Raw Number (not normalized)
	abundance
end

include("genetics.jl")


# (1) Inputter
# This gets molecules for proteins on demand using a specified function from include.jl

include("input.jl")
pool = Molecule[]

function fromFactory()
	while true
		# Gets from existing molecule pool
		if length(pool) > 0
			molecule = shift!(pool)
			produce(molecule)
		# If the pool is empty, create something new for the pool
		else
			produce(getMolecule())
		end
	end
end

t = @task fromFactory()

# (2) Consumer

# This assigns molecules to proteins based on distribution

# Using Proteins to do (terrible) things to molecules

function consumer()
		processMolecule(consume(t), proteinDistribution)
end


function processMolecule(molecule, pd) 

	# 1 - Normalised Protein Distribution
	normPD = ProteinAbundance[]
	sumPD = 0

	for p in pd 
		sumPD = sumPD + p.abundance
	end

	for p in pd 
		normPA = ProteinAbundance(p.gene, (p.abundance/sumPD))
		push!(normPD,normPA)
	end

	# 2 - Distribute 
	handOfGod = rand()
	sumNPD = 0
	# Bad Default
	assignedProtein = root

	for p in normPD
		sumNPD = sumNPD + p.abundance
		if (sumNPD > handOfGod)
			assignedProtein = p.gene
			break
		end
	end

	# 3 - Run Process

	return (assignedProtein.protein(molecule))

end





###### Main Loop ######
println("Cell is Alive")

complete = false
while complete == false

	# Run it like its hot
	consumer()
	complete = checkEndCon()

end

###### Final Steps ######
println("Cell is Dead")

