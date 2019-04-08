A simple [Plots.jl](https://github.com/JuliaPlots/Plots.jl) recipe to plot maps from .shp files using  [Shapefile.jl](https://github.com/JuliaGeo/Shapefile.jl) with colors.

```julia
using ShapefilePlots
shp = open("test.shp") do fd
    read(fd,Shapefile.Handle)
end
plot(shp, rand(length(shp.shapes)))
```

![](https://www-n.oca.eu/aferrari/data/test.png)

