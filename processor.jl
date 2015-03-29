
function fromInside()
	while true
		if length(inside) > 0
			produce(shift!(inside))
		end
	end
end

function fromEnvironment(outside, inside)
	while true
		r = rand()
		if r < 0.5
			produce(consume(outside))
		else
			produce(consume(inside))
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

t = @task fromFactory(randomMolecule)


processMolecule(consume(t), proteinDistribution)