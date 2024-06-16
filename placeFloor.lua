args = {...}
local depth = tonumber(args[1])
local width = tonumber(args[2])
local height = tonumber(args[3])
i=0
floorCount=0
selected=0
coeficient=1
placeBlockName=""
function turn()
    if(turnDirection == 0) then
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
    success, data = turtle.inspectDown()
    if(data.name ~= placeBlockName) then
        turtle.digDown()
        turtle.placeDown()
    end
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
    for i=1,16 do
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
function returnToPlaceBlock(w,d,rigth)
    if(right == false) then
        turtle.turnLeft()
    else
        turtle.turnRight()
    end
    turtle.turnRight()
    turtle.turnRight()
    for i=1, d do
        turtle.dig()
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.turnLeft()
    if(right == false) then
        turtle.turnRight()
        turtle.turnRight()
        for i=2, w do
            turtle.dig()
            turtle.forward()
        end
        turtle.turnLeft()
        turtle.turnLeft()
    end
end
function run()
    turtle.turnLeft()
    turtle.turnLeft()
    refillBlocks()
    placeBlockName = turtle.getItemDetail(1).name
    turtle.turnRight()
    turtle.turnRight()
    up = true
    right = true
    curDepth=0
    for w=1,width do
        for d=2,depth do
            curDepth = d
            for h=1,height do
                turtle.dig()
                if(h < height) then
                    turtle.digUp()
                end
                turtle.up()
            end
            for h=1,height do
                turtle.down()
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
        if(w*curDepth >= 512*coeficient) then
            coeficient = coeficient + 1
            returnToPlaceBlock(curDepth,w,rigth)
            turtle.turnRight()
            turtle.turnRight()
            storeAndRefillBlocks()
            turtle.turnLeft()
            turtle.turnLeft()
            if(right == true) then
                turtle.turnRight()
                for i=1, w do
                    turtle.dig()
                    turtle.forward()
                end
                turtle.turnLeft()
            else
               returnToPlaceBlock(curDepth,w,not(right))
            end
        end
    end
end
run()