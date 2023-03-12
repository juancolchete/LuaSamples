function makeLadder()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.digDown()
    if(turtle.detectDown()) then
        return false
    end
    turtle.down()
end
i=0
continue = true
while continue do
    continue = makeLadder()
    i = i + 1
end