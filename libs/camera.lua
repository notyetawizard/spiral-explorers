local camera = {
    x = 0,
    y = 0,
    z = 2,
    w = love.graphics.getWidth(),
    h = love.graphics.getHeight()
}

function camera:init()
    self.xo = (self.w/2/self.z)
    self.yo = (self.h/2/self.z)
end

function camera:set()
    love.graphics.scale(self.z)
    love.graphics.translate(self.xo - self.x, self.yo - self.y)
end

--Get mouse position, adujsting for camera;
--relative to camera if rel == true
function camera:getMousePos(rel)
    mx, my = love.mouse.getPosition()
    mx, my = (mx/2) - self.xo, (my/2) - self.yo
    if rel == true then return mx, my
    else return mx + self.x, my + self.y
    end
end

--Get mouse angle from camera
--[[
Removed in favor of entity:angleTo, but keeping it around
until I'm *sure* I don't need it.

function camera:getMouseAng()
    mx, my = self:mousePos(true)
    return math.atan2(my, mx)
end
--]]

return camera
