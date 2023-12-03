function axis()
    x1 , y1, z1 = gps.locate( 2, false )
    while turtle.detect() do
      turtle.dig()
        end
        turtle.forward()
    x2 , y2 , z3=gps.locate( 2, false )
    if x2-x1 == 1 and y2-y1 ==0 then
      dir="X"
    elseif x2-x1 == -1 and y2-y1 ==0 then
      dir="W"
    elseif x2-x1 == 0 and y2-y1 ==1 then
      dir="Y"
    elseif x2-x1 == 0 and y2-y1 ==-1 then
      dir="-Y"
    else
      dir="something went terrible wrong"
    end
    return(dir)
end