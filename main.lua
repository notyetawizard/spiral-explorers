HC = require "libs/HC"
camera = require "libs/camera"
control = require "libs/control"
entity = require "libs/entity"
--Temporary values--

explorer_shape = {0,0, 12,0, 16,8, 12,16, 0,16}
explorer_color = {0, 128, 128, 255}
explorer_stats = {mass = 10, mov_force = 1.8, max_velocity = 6, rot_force = 0.12}

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
    
    explorer = entity.new(100, 100, "polygon", explorer_shape, explorer_color, explorer_stats)
    
    watcher = entity.new(87, 200, "polygon", explorer_shape, {0, 0, 255, 255}, explorer_stats)
    
    table.insert(smobjects, explorer)
    table.insert(smobjects, watcher)
    
    camera:init()
    control.entity = explorer
end

function love.update()
    control.updateKeys()
    explorer:move()
    
    control.updateMouse()
    explorer:rotateTo(control.dx, control.dy)
    
    --watcher looks at explorer
    watcher:rotateTo(explorer.x, explorer.y)
    
    camera.x, camera.y = explorer.shape:center()
end

function love.draw()
    camera:set()
    
    for k,v in pairs(smobjects) do
        love.graphics.setColor(unpack(v.color))
        v.shape:draw("line")
    end
end
