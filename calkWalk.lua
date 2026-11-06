-- Initialize coordinates
local x, y, z = 0, 0, 0
local facing = 0 -- 0: North (-z), 1: East (+x), 2: South (+z), 3: West (-x)

function turnRight()
    turtle.turnRight()
    facing = (facing + 1) % 4
end

function turnLeft()
    turtle.turnLeft()
    facing = (facing - 1) % 4
end

-- Robust forward movement with obstacle handling
function forward()
    if turtle.getFuelLevel() == 0 then
        print("Error: Out of fuel!")
        return false
    end
    
    -- Keep trying to move forward until successful
    while not turtle.forward() do
        local hasBlock, data = turtle.inspect()
        if hasBlock then
            turtle.dig() -- Mine the block in the way
        else
            turtle.attack() -- Attack mobs in the way
            os.sleep(0.5)
        end
    end
    
    -- Update coordinates only AFTER successful movement
    if facing == 0 then z = z - 1
    elseif facing == 1 then x = x + 1
    elseif facing == 2 then z = z + 1
    elseif facing == 3 then x = x - 1
    end
    return true
end

-- Robust up movement
function up()
    while not turtle.up() do
        if turtle.inspectUp() then turtle.digUp() 
        else turtle.attackUp(); os.sleep(0.5) end
    end
    y = y + 1
    return true
end

-- Robust down movement
function down()
    while not turtle.down() do
        if turtle.inspectDown() then turtle.digDown() 
        else turtle.attackDown(); os.sleep(0.5) end
    end
    y = y - 1
    return true
end

function face(targetDir)
    while facing ~= targetDir do
        turnRight()
    end
end

function returnHome()
    print("Returning home...")
    
    -- Fix Y axis
    while y > 0 do down() end
    while y < 0 do up() end
    
    -- Fix X axis
    if x > 0 then
        face(3)
        while x > 0 do forward() end
    elseif x < 0 then
        face(1)
        while x < 0 do forward() end
    end
    
    -- Fix Z axis
    if z > 0 then
        face(0)
        while z > 0 do forward() end
    elseif z < 0 then
        face(2)
        while z < 0 do forward() end
    end
    
    face(0)
    print("Arrived at initial point!")
end

-- === TEST RUN ===
print("Starting test...")
up()
forward()
up()
turnRight()
forward()
-- The turtle should now break any blocks in its way to get back
returnHome()
