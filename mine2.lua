i = 0
depth = tonumber(io.read())
while i < depth do
  turtle.dig()
  turtle.digUp()
  turtle.forward()
  turtle.dig()
  turtle.digUp()
  if i % 10 == 0 then
    turtle.turnRight()
    turtle.select(2)
    turtle.placeUp()
    turtle.turnLeft()
    turte.select(1)
  end
  i = i + 1
end
