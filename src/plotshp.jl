function polygon2shape(polygon::Shapefile.Polygon{Float64})
    Plots.Shape([pt.x for pt=polygon.points], [pt.y for pt in polygon.points])
end

function shapefile2shapes(shapefile::Shapefile.Handle{Shapefile.Polygon{Float64}})
    [polygon2shape(polygon) for polygon in shapefile.shapes]
end

@recipe function f(shapefile::Shapefile.Handle{Shapefile.Polygon{Float64}}, val_fill::Vector)
    seriestype  :=  :shape
    fill_z := val_fill
    label --> ""
    ratio := :equal
    axis := false
    grid := false
    linewidth --> 0.1

    shapefile2shapes(shapefile)
end
