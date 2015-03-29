
function fromEnvironment(outside, permeability)
	while true
		r = rand()
		if r < permeability
			produce(consume(outside))
		else
			if length(fetch(pool)) > 0
				produce(shift!(fetch(pool)))
			else 
				produce(consume(outside))
			end
		end
	end
end

function randomMolecule()
	return Molecule(rand())
end

function fromFactory(design)
	while true
		produce(design())
	end
end

outside = @task fromFactory(randomMolecule)

environment = @task fromEnvironment(outside, 0.5)

mset = processMolecule(consume(environment), proteinDistribution)
append!(mset, pool)
