args = {...}
local x = tonumber(args[1])
local y = tonumber(args[2])
local z = tonumber(args[3])
local curX,curY,curZ = gps.locate()
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
function placeBlockDown()
    turtle.select(1)
    turtle.placeDown()
end
function mine()
    turtle.dig()
    turtle.forward()
    turtle.digUp()
end
function returnNorth()
    shell.run("getFacing")
    local h = fs.open("facing", "r")
    local startPoint = h.readAll()
    h.close()
    print("Start point",startPoint,"X:",x,"Y:",y,"Z:",z)
    if startPoint == "W" then
        turtle.turnRight()
    elseif startPoint == "S" then
        turtle.turnRight()
        turtle.turnRight()
    elseif startPoint == "E" then
        turtle.turnLeft()
    else
        print("\nStarting from North")
    end
end

function getGPSLocation()
    curX,curY,curZ = gps.locate()
    print("x: ",curX,"y",curY,"z:",curZ)
end

function mineline()
    if(torchCount == 7)then
        torchCount=0
        putTorch()
    end
    if(turtle.detectDown() == false) then
        placeBlockDown()
    end
    torchCount = torchCount + 1
    mine()
    i = i + 1
end

function goZ()
    if curZ < z then
        turtle.turnLeft()
        turtle.turnLeft() 
        while curZ < z do
            mineline()
            getGPSLocation()
        end 
    elseif curZ > z then
        while curZ > z do
            mineline()
            getGPSLocation()
        end 
    end
end

function goX()
    if curX > x then
        turtle.turnLeft() 
        while curX > x do
            mineline()
            getGPSLocation()
        end 
    elseif curX < x then
        turtle.turnRight() 
        while curX < x do
            mineline()
            getGPSLocation()
        end 
    end 
end

function moveY(doUp)
    if doUp then
        turtle.digUp()
        turtle.up()
    else
        turtle.digDown()
        turtle.down()
    end
end

function goY()
    while curY > y do
        moveY(false)
        getGPSLocation()
    end 
    while curY < y do
        moveY(true)
        getGPSLocation()
    end
end

function gocords()
    returnNorth()
    goZ()
    returnNorth()
    goX()
    goY()
end

gocords()