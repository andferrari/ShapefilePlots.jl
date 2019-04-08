A simple [Plots.jl](https://github.com/JuliaPlots/Plots.jl) recipe to plot maps from .shp files using  [Shapefile.jl](https://github.com/JuliaGeo/Shapefile.jl) with colors.

#Install

```julia
(v1.1) pkg> add https://github.com/andferrari/ShapefilePlots.jl.git
```

#Demo

```julia
using Plots
using Shapefile
using ShapefilePlots

# shapefile from https://fr.actualitix.com/
test_file = joinpath(dirname(dirname(pathof(Shapefile))),"test/test.shp")

shp = open(test_file) do fd
    read(fd,Shapefile.Handle)
end
plot(shp, rand(shp.length))
```
should give:
![](https://www-n.oca.eu/aferrari/data/test.png)
