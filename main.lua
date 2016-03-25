HC = require "libs/HC"
camera = require "libs/camera"
--Temporary values--

explorer = {
    shape = HC.polygon(0,0, 12,0, 16,8, 12,16, 0,16),
    color = {0, 128, 128, 255},
    speed = 2
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

--Löve functions--

function love.load()
    --love.mouse.setGrabbed(true)    
    world = HC.new(64)
    explorer.shape:moveTo(100,100)
    camera:init()
end

function love.update()
    camera.x, camera.y = explorer.shape:center()
    explorer.shape:setRotation(camera:mouseAng())
    
    local edx, edy = 0, 0
    if love.keyboard.isDown(",") then edy = edy - explorer.speed end
    if love.keyboard.isDown("o") then edy = edx + explorer.speed end
    if love.keyboard.isDown("a") then edx = edx - explorer.speed end
    if love.keyboard.isDown("e") then edx = edx + explorer.speed end
    explorer.shape:move(edx, edy)

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
