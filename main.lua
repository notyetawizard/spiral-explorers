HC = require "libs/HC"
camera = require "libs/camera"
control = require "libs/control"
entity = require "libs/entity"
--Temporary values--

explorer_shape = {0,0, 12,0, 16,8, 12,16, 0,16}
explorer_color = {0, 128, 128, 255}
explorer_stats = {mass = 10, mov_force = 1.8, max_velocity = 6, rot_force = 0.12}

smobjects = {
    entity.new(234, 125, "circle", {0, 0, 16}, {0, 255, 0 ,255}, explorer_stats),
    entity.new(20, 50, "circle", {0, 0, 30}, {0, 255, 0 ,255}, explorer_stats),
    entity.new(150, 125, "circle", {0, 0, 10}, {0, 255, 0 ,255}, explorer_stats),
    entity.new(89, 20, "rectangle", {0, 0, 64, 20}, {0, 255, 0 ,255}, explorer_stats),
    entity.new(180, 155, "rectangle", {0, 0, 11, 203}, {0, 255, 0 ,255}, explorer_stats)
}

--Löve functions--
function love.load()
    --love.mouse.setGrabbed(true)    
    HC.resetHash(64)
    
    explorer = entity.new(100, 100, "polygon", explorer_shape, explorer_color, explorer_stats)
    
    watcher = entity.new(87, 200, "polygon", explorer_shape, {0, 0, 255, 255}, explorer_stats)
    
    table.insert(smobjects, explorer)
    table.insert(smobjects, watcher)
    
    camera:init()
    control.entity = explorer
end

function love.update()
    control.updateKeys()
    --explorer:update()
    
    for k,v in pairs(smobjects) do
        v:update()
    end
    
    control.updateMouse()
    explorer:rotateTo(control.dx, control.dy)
    
    --watcher looks at explorer
    watcher:rotateTo(explorer.x, explorer.y)
    
    camera.x, camera.y = explorer:center()
end

function love.draw()
    camera:set()
    
    for k,v in pairs(smobjects) do
        love.graphics.setColor(unpack(v.color))
        v:draw("line")
    end
end
