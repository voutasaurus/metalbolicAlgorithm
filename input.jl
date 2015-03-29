# input.jl

# This script defines the problem being solved in the form of a data structure.

# Modify the data structure manually to change the problem
# In the future we'd want scripts that take data in other forms and output to new input.jl files


###### Example Input ######


println("Input Importing Begun")

function getMolecule()
	println("Processing a Random Molecule")
	return Molecule(rand())
end

println("Input Importing Finished")