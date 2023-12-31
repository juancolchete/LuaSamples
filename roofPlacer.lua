print("Roof placer program")
print("by juanudk")
args = {...}
local lenght = tonumber(args[1])
local width = tonumber(args[2])
write("lenght: ",length)
write("width: ",width)
turnLeft = true
blockCounter = 0
grid = 1
function place()
    turtle.digUp()
    turtle.placeUp()
    blockCounter = blockCounter + 1
    if(blockCounter == 64) then
        grid = grid + 1
        turtle.select(grid)
        blockCounter = 0
    end
end
function moveFoward()
    turtle.dig()
    turtle.forward()
end
function turn()
    if(turnLeft) then
      turtle.turnLeft()
      moveFoward()
      turtle.turnLeft()
      moveFoward()
      turnLeft = false    
    else
      turtle.turnRight()
      moveFoward()
      turtle.turnRight()
      moveFoward()
      turnLeft= true
    end
end
 
i=0
j=0
while(j < width) do
  while(i < lenght) do
    i = i + 1
    place()
    moveFoward()
  end
  i=0
  j = j + 1
  turn()
end
