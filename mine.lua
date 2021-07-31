size = tonumber(io.read())
i=0
turnCount=0
torchCount=0
turnDirection=0
function putTorch()
    turtle.select(16)
    turtle.back()
    turtle.placeUp()
    turtle.forward()
end
function turn()
    if(turnDirection == 0)then
        turnDirection = 1
        turtle.turnLeft()
    else
        turtle.turnRight()
    end
end
function placeBlockDown()
    turtle.select(1)
    turtle.placeDown()
end
function mine()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
end
while i<size do
    if(torchCount == 7)then
        torchCount=0
        putTorch()
    end
    if(turnCount == 20)then
        turnCount=0
        putTorch()
    end
    if(turtle.detectDown() == false) then
        placeBlockDown()
    end
    torchCount = torchCount + 1
    turnCount = turnCount + 1
    mine()
    i = i + 1
end