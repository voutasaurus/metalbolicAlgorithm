println("Importing distributed map for protein molecule interactions")

m = "some molecule"
moleculePool = [m,m,m,m]
sampleProtein = (x -> [x, x * "d"]) 

chunky :: Array{Array{ASCIIString, 1}, 1}
chunky = map(sampleProtein, moleculePool) 
flat = foldl(union, chunky)
vec(chunky)