local facing
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
  elseif y - ny == 1 then
    facing = 2
  else
    facing = 0
  end
end