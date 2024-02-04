args = {...}
local width = tonumber(args[1])
local depth = tonumber(args[1])
i=0
floorCount=0
selected=0
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
function placeFloor()
    selected = math.floor(floorCount / 64) + 1
    turtle.select(selected)
    turtle.digDown()
    turtle.placeDown()
    turtle.dig()
    turtle.forward()
    floorCount = floorCount + 1
end
function run()
    up = true
    right = true
    for d=1,depth do
        for w=2,width do
            placeFloor()
        end
        if(right == true) then
            turtle.turnRight()
            placeFloor()
            turtle.turnRight()
            right = false
        else
            turtle.turnLeft()
            placeFloor()
            turtle.turnLeft()
            right = true
        end
    end
end
run()