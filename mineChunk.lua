turnLeft = true
write("Depth: ")
depth = tonumber(io.read())
function blockAction()
  turtle.dig()
  turtle.forward()
  turtle.digDown()
end
function backStart()
    turtle.turnRight()
    i=0
    while i< 16 do
        i = i + 1
        turtle.dig()
        turtle.forward()
    end
    turtle.turnLeft()
    turnLeft = true
end 
function turn()
    if(turnLeft) then
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
      turnLeft = false
   else
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
      turnLeft = true
   end
end
y=0
i=0
j=0
while y < depth do 
  while i < 16 do
   while j < 16 do
     blockAction()
     j = j + 1
   end
  j=0
  i = i + 1
  turn()
 end
 backStart()
 turtle.digDown()
 turtle.down()
 i=0
 j=0
 y=y+1
end
