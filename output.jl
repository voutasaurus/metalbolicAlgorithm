#output.jl
outputCount = 0
#Example

function checkEndCon()
	if outputCount > 10
		println("CheckEndCon: End!")
		println(" ")
		return true
	else
		println("CheckEndCon: Nope ", outputCount)
		println(" ")
		return false
	end
end