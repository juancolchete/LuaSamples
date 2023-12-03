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
    facing = 3
  elseif z - nz == 1 then
    facing = 0
  else
    facing = 2
  end
end
local h = fs.oprn("facing.lua","w")
h.write(dir[facing+1]