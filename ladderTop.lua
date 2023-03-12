function makeLadder()
    turtle.digUp()
    turtle.up()
    if(turtle.detectUp() == false) then
        return false
    end
    turtle.digUp()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
    return true
end
i=0
continue = true
while continue do
    continue = makeLadder()
    i = i + 1
end