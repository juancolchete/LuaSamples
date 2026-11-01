args = {...}
local length = tonumber(args[1])

local function digLadder()
  turtle.dig()
  turtle.forward()
  turtle.digUp()
  turtle.digDown()
  turtle.down()
end
for step = 1, length do
  digLadder()
end
