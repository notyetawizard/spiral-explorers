HC = require "libs/HC"
camera = require "libs/camera"
--Temporary values--

explorer = {
    shape = HC.polygon(0,0, 12,0, 16,8, 12,16, 0,16),
    color = {0, 128, 128, 255},
    aspeed = 0.5,
    mspeed = 2,
    rspeed = 0.12
    moment = {0,0}
}

boundary = {
    shape = HC.rectangle(0,0, 350, 250),
    color = {255, 0, 0, 255}
}

smobjects = {
    {color = {0, 255, 0 ,255}, shape = HC.circle(234,125, 16)},
    {color = {0, 255, 0 ,255}, shape = HC.circle(50,50, 30)},
    {color = {0, 255, 0 ,255}, shape = HC.circle(150,125, 10)},
    {color = {0, 255, 0 ,255}, shape = HC.rectangle(89,20, 64,20)},
    {color = {0, 255, 0 ,255}, shape = HC.rectangle(180,55, 11,203)}
}

function capRange(n,h,l)
    if n > h then return h
    elseif n < (l or -h) then return (l or -h)
    else return n
    end
end

function wrapRange(n,h,l)
    if n > h then return (l or -h)
    elseif n < (l or -h) then return (l or h)
    else return n
    end
end

--Move these functions into the object class or something.
function accRotate(self, dr)
    self.shape:rotate(capRange(wrapRange(dr, math.pi), self.rspeed))
    self.shape:setRotation(wrapRange(self.shape:rotation(), math.pi))
end

function accMove(self)
    
end

explorer.accRotate = accRotate
explorer.accMove = accMove
--Löve functions--
function love.load()
    --love.mouse.setGrabbed(true)    
    world = HC.new(64)
    explorer.shape:moveTo(100,100)
    camera:init()
end

function love.update()
    camera.x, camera.y = explorer.shape:center()
    explorer:accRotate(camera:mouseAng() - explorer.shape:rotation())

    edx, edy = explorer.moment[1], explorer.moment[2]
    if love.keyboard.isDown(",") then edy = edy - explorer.aspeed end
    if love.keyboard.isDown("o") then edy = edx + explorer.aspeed end
    if love.keyboard.isDown("a") then edx = edx - explorer.aspeed end
    if love.keyboard.isDown("e") then edx = edx + explorer.aspeed end
    
    --explorer.shape:move(edx, edy)
end

function love.draw()
    camera:set()

    love.graphics.setColor(unpack(boundary.color))
    boundary.shape:draw("line")
    
    for k,v in pairs(smobjects) do
        love.graphics.setColor(unpack(v.color))
        v.shape:draw("line")
    end
    
    love.graphics.setColor(unpack(explorer.color))
    explorer.shape:draw("line")
end
