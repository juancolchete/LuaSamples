function up(times)
    for i=1,times do
        turtle.up()
    end
end

function down(times)
    for i=1,times do
        turtle.down()
        turtle.digDown()
    end
end

function removeBellowThree(width,deepth,heigth)
    local turnRight = true;
    for h=0,heigth do
        for d=0,deepth do
            for w=0,width do
                turtle.digUp()
                turtle.digDown()
                turtle.dig()
                turtle.forward()
            end
            if(turnRight == true) then
                print("turnRight")
                turtle.turnRight()
                turtle.forward()
                turtle.turnRight()
                turnRight = false
            else
                print("turnleft")
                turtle.turnLeft()
                turtle.forward()
                turtle.turnLeft()
                turnRight = true
            end
        end
        down(2)
        turnRight = not turnRight
    end
end
print(shell.run("getFacing"))
local h = fs.open("facing", "r")
print(h.readAll())
h.close()
local w = fs.open("woodConf.txt", "r")
local startX = tonumber(w.readLine());
local startY = tonumber(w.readLine());
local startZ = tonumber(w.readLine());
local baseX = tonumber(w.readLine());
local baseY = tonumber(w.readLine());
local baseZ = tonumber(w.readLine());
w.close()
print("sX",startX,"sY",startY,"sZ",startZ)
shell.run("gocords",startX,startY,startZ)
up(16)
removeBellowThree(10,23,7)
print("bX",baseX,"bY",baseY,"bZ",baseZ)
shell.run("gocords",baseX,baseY,baseZ)