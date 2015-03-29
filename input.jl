# input.jl

# This script defines the problem being solved in the form of a data structure.

# Modify the data structure manually to change the problem
# In the future we'd want scripts that take data in other forms and output to new input.jl files


###### Example Input ######

inputterType = "normal"

println("Input Importing Begun")

m1 = Molecule(1)
push! (outside,m1)

m2 = Molecule(0)
push! (outside,m2)

m3 = Molecule(1)
push! (outside,m3)

m4 = Molecule(1)
push! (outside,m4)

m5 = Molecule(0)
push! (outside,m5)

m6 = Molecule(1)
push! (outside,m6)


println("Input Importing Finished")