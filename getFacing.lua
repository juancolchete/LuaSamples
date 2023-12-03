local checkObs = true

if checkObs then
  for i=1,4 do
    if turtle.detect() then
      turtle.dig()
    end
    turtle.turnRight()
  end
  turtle.digUp()
  turtle.digDown()
end

if type(turtle.getFuelLevel()) == "number" and turtle.getFuelLevel() < 2 then
  print("Not enough Fuel")
  return
end

local torchesM = {"West","East","North","South","Invalid"}

local items = {["minecraft:ladder"]={"Invalid","South","North","East","West"},
               ["minecraft:torch"]=torchesM,
               ["minecraft:redstone_torch"]=torchesM}

for i=1,16 do
  if turtle.getItemCount(i) > 0 and not items[turtle.getItemDetail(i).name] then
    turtle.select(i)
    if turtle.place() then
      break
	end
  end
end

repeat until turtle.up()

for i=1,16 do
  if turtle.getItemCount(i) > 0 and items[turtle.getItemDetail(i).name] then
    turtle.select(i)
    turtle.placeDown()
    break
  end
end

local d,b = turtle.inspectDown()

turtle.digDown()
repeat until turtle.down()
turtle.dig()

if not d then
  print("That did not work")
  return
end

print(string.format("This turtle is facing %s",items[b.name][b.metadata]))