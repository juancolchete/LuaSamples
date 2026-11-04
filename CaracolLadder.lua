args = {...}
local length = tonumber(args[1])
turtle.select(16)
local function digLadder()
  turtle.digUp()
  turtle.digDown()
  turtle.down()
  turtle.turnLeft()
  turtle.dig()
  turtle.forward()
  turtle.digDown()
  turtle.digUp()
  turtle.down()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.digDown()
  turtle.down()
end
for step = 1, length do
  digLadder()
end
