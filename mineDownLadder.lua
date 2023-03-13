function makeLadder()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.up()
    turtle.digUp()
    turtle.down()
    turtle.digDown()
    if(turtle.detectDown()) then
        return false
    end
    turtle.down()
    return true
end
function putTorch()
    turtle.select(16)
    turtle.placeUp()
end
i=0
continue = true
torchCount=0
while continue do
    continue = makeLadder()
    i = i + 1
    if(torchCount == 7)then
        torchCount=0
        putTorch()
    end
    torchCount = torchCount + 1
end