using Plots
using Shapefile
using ShapefilePlots

# shapefile from https://fr.actualitix.com/
shp = open("test.shp") do fd
    read(fd,Shapefile.Handle)
end

plot(shp, rand(shp.length))
