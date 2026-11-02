args = {...}
local length = tonumber(args[1])
turtle.select(16)
local function digLadder()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.digDown()
  turtle.down()
end
for step = 1, length do
  if step % 4 == 0 then
    turtle.placeUp()
  end
  digLadder()
end
