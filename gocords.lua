write("Start point Nort South West East: ")
startPoint = io.read()
write("current x: ")
curX = tonumber(io.read())
write("current y: ")
curY = tonumber(io.read())
write("current z: ")
curZ = tonumber(io.read())
write("x: ")
x = tonumber(io.read())
write("y: ")
y = tonumber(io.read())
write("z: ")
z = tonumber(io.read())

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
    if startPoint == "W" then
        turtle.turnRight()
    elseif startPoint == "S" then
        turtle.turnRight()
        turtle.turnRight()
    elseif startPoint == "E" then
        turtle.turnLeft()
    else
        write("Starting from North")
    end
end

function start()
    returnNorth()
    goX()
end

start()

function mineline()
    if(torchCount == 7)then
        torchCount=0
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

function goX()
    while curX > x
        curX = curX - 1
        mineline()
    end 
    if curX < x then
        turtle.turnLeft() 
        turtle.turnLeft() 
    end 
    while curX < x
        curX = curX - 1
        mineline()
    end 
end