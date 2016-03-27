control = {}

function control.updateMouse()
    control.mx, control.my = camera:getMousePos()
end

function control.updateKeys()
    if love.keyboard.isDown(",") then
        --explorer.my = explorer.my - explorer.acl_speed
        explorer:push(camera.north, explorer.acl_speed)
    end
    if love.keyboard.isDown("o") then
        explorer:push(camera.south, explorer.acl_speed)
    end
    if love.keyboard.isDown("a") then
        explorer:push(camera.west, explorer.acl_speed)
    end
    if love.keyboard.isDown("e") then
        explorer:push(camera.east, explorer.acl_speed)
    end
end

return control
