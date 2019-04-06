using Plots
using Shapefile
using ShapefilePlots

shp = open("test/departements.shp") do fd
    read(fd,Shapefile.Handle)
end
plot(shp, rand(length(shp.shapes)))