write("Height: ")
height = tonumber(io.read())
write("Length: ")
length = tonumber(io.read())
function place()
    turtle.dig()
    turtle.place()
end
function up()
    turtle.digUp()
    turtle.up()
end
function down()
    turtle.digDown()
    turtle.down()
end
isUp=1
function goDirection()
    if isUp == 1 then
        up()
    else
        down()
    end
end
function moveNext()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnLeft()
    if isUp == 1 then
        isUp = 0
    else
        isUp = 1
    end
end
i=0
while i < length  do
    j=1
    while j < height do
        place()
        goDirection()
        j = j + 1
    end
    place()
    moveNext() 
    i = i + 1
end
