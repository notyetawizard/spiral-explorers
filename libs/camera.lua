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

--Get mouse position from camera.
function camera:mousePos()
    mx, my = love.mouse.getPosition()
    return (mx/2) - self.xo, (my/2) - self.yo 
end
--Get mouse angle from camera
function camera:mouseAng()
    mx, my = self:mousePos()
    return math.atan2(my, mx)
end
--Get mouse position on map
function camera:mouseAbs()
    mx, my = love.mouse.getPosition()
    return (mx/2) - self.xo + self.x, (my/2) - self.yo + self.y 
end

return camera
