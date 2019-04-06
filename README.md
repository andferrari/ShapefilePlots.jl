A simple [Plots.jl](https://github.com/JuliaPlots/Plots.jl) recipe to plot maps from .shp files using  [Shapefile.jl](https://github.com/JuliaGeo/Shapefile.jl) with colors.



```julia
using ShapefilePlots
shp = open("myfile.shp") do fd
    read(fd,Shapefile.Handle)
end
plot(shp, rand(length(shp.shapes)))
```

