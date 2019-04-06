function polygon2shape(polygon::Shapefile.Polygon{Float64})
    x =  zeros(length(polygon.points))
    y = similar(x)
    for ip in 1:length(polygon.points)
        x[ip] = polygon.points[ip].x
        y[ip] = polygon.points[ip].y
    end
    Shape(x,y)
end

function shapefile2shapes(shapefile::Shapefile.Handle{Shapefile.Polygon{Float64}})
    n_shapes = length(shapefile.shapes)
    all_shapes = Vector{Shape}(undef, n_shapes)
    for n in 1:n_shapes
        all_shapes[n] = polygon2shape(shapefile.shapes[n])
    end
    all_shapes
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
