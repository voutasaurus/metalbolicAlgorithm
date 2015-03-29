#output.jl
outputCount = 0
#Example

function checkEndCon()
	if outputCount > 10
		return true
	else
		println("output count is ", outputCount)
		return false
	end
end