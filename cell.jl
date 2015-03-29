# cell.jl

# This is the main script, set up input.jl and genetics.jl then run this in Julia.

srand(0)

###### Initial Set Up ######
println("Creating Cell")


# Set Up Input Data Structure to be Called
# This is to be modified by the user (problem defintions)

type Molecule
	# data stored in molecule
	data 
end

# Creating buckets for molecules
outside = Molecule[]
inside = Molecule[]


include("input.jl")

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


# Using Proteins to do (terrible) things to molecules

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

processMolecule(m1, proteinDistribution)


# (1) Inputter



function inputter(inside, outside)
	if (inputterType == "normal")
		#Start Process
		push!(inside, outside[end])
		pop!(outside)
	end
end

@spawn inputter(inside, outside)



 
###### Main Loop ######
println("Cell is Alive")

complete = false
while complete == false

	# NB. This is probably the wrong way to do this because of parallel processes ^.^
	# Plz to be fixes this?


	# (1) Inputter Process 
	# Adds new input molecules from input data structure in a way defined here


	# (2) Modify Protein Amounts Proteins
	# Modifies the number of proteins in a unified way
	# Adds based on genetics tree values
	# Removes based on protein types

	# You will be modifying the proteinDistribution array and the abundance property within the ProteinAbundance tuples inside it


	# (3) Pair Proteins and Molecules somehow and run their scripts in parallel somehow!


	# (4) Process checking output to see if the entire process is done and can be ended


	#=
		if <condition> = true
			complete = true
		end
	=#

	complete = true

end

###### Final Steps ######
println("Cell is Dead")

