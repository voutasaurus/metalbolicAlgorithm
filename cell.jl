# cell.jl

# This is the main script, set up input.jl and genetics.jl then run this in Julia.

###### Initial Set Up ######
println("Creating Cell")


# Set Up Input Data Structure to be Called
# This is to be modified by the user (problem defintions)

type Molecule
	# data stored in molecule
	data 
	# outside (false) or inside (true) of cell
	location
end

include("input.jl")

# Set Up Genetics Data Structure to be Referenced
# This is to be modified by the user (problem solution)

type Gene
	# tree structure
	parent
	# access, modified by proteins
	access
	# name of protein it creates
	protein
	# length of protein life
	lifetime
end


type ProteinAbundance 
	#Protein Type = Gene Type
	protein
	# Percentage as a float
	abundance
end

include("genetics.jl")


 
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

