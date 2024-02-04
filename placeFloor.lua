args = {...}
local width = tonumber(args[1])
local depth = tonumber(args[1])
i=0
floorCount=0
selected=0
coeficient=1
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
function goBack(count) 
    for i=1,count do
        turtle.back()
    end
end
function goForward(count) 
    for i=1,count do
        turtle.forward()
    end
end
function storeAndRefillBlocks()
    for i=8,16 do
        turtle.select(i)
        turtle.drop()
    end
    refillBlocks()
    floorCount = 0
end
function refillBlocks()
    for i=1,8 do
        turtle.select(i)
        turtle.suck()
    end
end
function returnToPlaceBlock(w,d)
    turtle.turnLeft()
    turtle.turnLeft()
    flag = true
    for i=1, d do
        goForward(w-2)
        if(d > 1) then
            if(flag == true) then
                turtle.turnRight()
                placeFloor()
                turtle.turnRight()
                flag = false
            else
                turtle.turnLeft()
                placeFloor()
                turtle.turnLeft()
                flag = true
            end
        end
    end
end
function run()
    turtle.turnLeft()
    turtle.turnLeft()
    refillBlocks()
    turtle.turnRight()
    turtle.turnRight()
    up = true
    right = true
    for d=1,depth do
        for w=2,width do
            if(d*w >= 512*coeficient) then
                coeficient = coeficient + 1
                if(right == true) then
                    turtle.turnRight()
                    goBack(d)
                    turtle.turnLeft()
                    goBack(w)
                else
                    turtle.turnLeft()
                    goBack(d)
                    turtle.turnLeft()
                    goBack(w)
                end
                turtle.turnLeft()
                turtle.turnLeft()
                storeAndRefillBlocks()
                returnToPlaceBlock(w,d)
            end
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