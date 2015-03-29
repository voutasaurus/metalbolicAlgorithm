#output.jl

outputCount = 0

#Example

function checkEndCon()
	if(outputCount > 10)
		return true
	else
		return false
	end
end