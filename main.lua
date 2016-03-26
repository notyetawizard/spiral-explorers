HC = require "libs/HC"
camera = require "libs/camera"
entity = require "libs/entity"
--Temporary values--

explorer_shape = {0,0, 12,0, 16,8, 12,16, 0,16}
explorer_color = {0, 128, 128, 255}
explorer_stats = {acl_speed = 0.5, max_speed = 2, rot_speed = 0.12}

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
    
    explorer = entity.new("polygon", explorer_shape, explorer_color, explorer_stats)
    explorer.shape:moveTo(100,100)
    
    watcher = entity.new("polygon", explorer_shape, {0, 0, 255, 255}, explorer_stats)
    watcher.shape:moveTo(87,200)
    
    table.insert(smobjects, explorer)
    table.insert(smobjects, watcher)
    
    camera:init()
end

function love.update()
    camera.x, camera.y = explorer.shape:center()
    local mx, my = camera:getMousePos()
    explorer:rotate(explorer:angleTo(mx, my, true))

    --local edx, edy = explorer.momentum[1], explorer.momentum[2]
    if love.keyboard.isDown(",") then edy = edy - explorer.acl_speed end
    if love.keyboard.isDown("o") then edy = edx + explorer.acl_speed end
    if love.keyboard.isDown("a") then edx = edx - explorer.acl_speed end
    if love.keyboard.isDown("e") then edx = edx + explorer.acl_speed end
    
    --explorer:move(edx, edy)
    
    --watcher looks at explorer
    wx, wy = explorer.shape:center()
    watcher:rotate(watcher:angleTo(wx, wy, true))
end

function love.draw()
    camera:set()
    
    for k,v in pairs(smobjects) do
        love.graphics.setColor(unpack(v.color))
        v.shape:draw("line")
    end
    
    love.graphics.setColor(unpack(explorer.color))
    explorer.shape:draw("line")
end
