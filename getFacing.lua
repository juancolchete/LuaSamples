local facing
local dir = {"N","W","S","E"}
local x, y, z = gps.locate( 1 )
if not x then
  error( "No GPS available", 0 )
end
if turtle.forward() then
  local nx, ny, nz = gps.locate( 1 )
  if x - nx == 1 then
    --#this is a direction
    facing = 1
  elseif x - nx == -1 then
    --#this is another direction
    facing = 0
  elseif z - ny == 1 then
    facing = 2
  else
    facing = 3
  end
end
print(facing)
print(dir[facing+1])