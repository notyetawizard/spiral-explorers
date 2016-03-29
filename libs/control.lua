gmath = require "libs/gmath"

control = {}

function control.updateMouse()
    control.dx, control.dy = camera:getMousePos()
end

function control.updateKeys()
    local dx, dy = 0, 0
    if love.keyboard.isDown(",") then dy = dy - 1 end
    if love.keyboard.isDown("o") then dy = dy + 1 end
    if love.keyboard.isDown("a") then dx = dx - 1 end
    if love.keyboard.isDown("e") then dx = dx + 1 end
    print(dx, dy)
    local da = gmath.angleTo(dx, dy)
    --Normalized for friction; move at predictable speed
    local df = explorer.mov_force * gmath.distanceTo(gmath.distanceTrim(1, dx, dy))
    explorer:push(da, df + df*explorer.friction)
end

return control
