args = {...}
local heigth = tonumber(args[1])
local width = tonumber(args[2])
local deepth = tonumber(args[3])
i=0
turnCount=0
torchCount=0
turnDirection=0
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
end
function mineD()
    up = true
    right = true
    for d=1,deepth do
        for w=1,width do
            for h=1,heigth do
                if(up == true) then
                    mine()
                    turtle.up()
                else
                    mine()
                    turtle.down()
                end
            end
            if(up == true) then
                up = false
            else
                up = true
            end
            if(right == true) then
                turtle.turnRight()
                turtle.forward()
                turtle.turnLeft()
            else
                turtle.turnLeft()
                turtle.forward()
                turtle.turnRight()
            end
        end
        turtle.forward()
        if(right == true) then
            right = false
        else
            right = true
        end
    end
end
mineD()