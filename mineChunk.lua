turnLeft = true
function blockAction()
  turtle.foward()
  turtle.digDown()
end
function turn()
    if(turnLeft) then
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
      turtle.dig()
      turtle.forward()
      turtle.turnLeft()
      turtle.forward()
      turnLeft = false
   else
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
      turtle.dig()
      turtle.forward()
      turtle.turnRight()
      turtle.forward()
      turnLeft = true
   end
end
i=0
j=0
while i < 16 do
  while j < 16 do
    blockAction()
    j = j + 1
   end
  j=0
  i = i + 1
  turn()
end
    
