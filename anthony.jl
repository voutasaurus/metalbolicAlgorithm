println("I'm awesome")

function transform(protein, molecule)
	# perform some kind of transformation
	# return the resultant molecule
	return (molecule * "′")
end

function regulate(genes, protein, molecule)
	# mutate genes (side effect) or message gene worker (side effect)
	return # no return value
end

function residue(outCell, protein, molecule)
	# message outCell object (side effect)
	return # no return value
end

# Specific to gene set object and cellular output destination
function interact1(genes, outCell, protein, molecule)
	return interact(
		protein,
		molecule,
		((y,z) -> regulate(genes,y,z)), # side effects
		((y,z) -> residue(outCell,y,z)) # side effects
		)
end

# Generic (regulate, produce residue, return resultant molecule)
# Assuming that transform doesn't depend on inputs apart from the protein type and the molecule type
function interact(protein, molecule, backRegulate, emitResidue)
	backRegulate(protein, molecule)
	emitResidue(protein, molecule)
	return transform(protein, molecule)
end

#=
# Here's a trivial example pattern for currying

function calling(x,y,z)
	return x+y+z
end

function test()
	x = 1
	temp = ((y,z) -> calling(x,y,z))
	return temp(1,3)
end
=#
