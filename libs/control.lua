control = {}

function control.updateMouse()
    control.mx, control.my = camera:getMousePos()
end

function control.updateKeys()
    if love.keyboard.isDown(",") then
        control.entity:applyForce(0, -control.entity.acl_speed)
    end
    if love.keyboard.isDown("o") then
        control.entity:applyForce(0, control.entity.acl_speed)
    end
    if love.keyboard.isDown("a") then
        control.entity:applyForce(-control.entity.acl_speed, 0)
    end
    if love.keyboard.isDown("e") then
        control.entity:applyForce(control.entity.acl_speed, 0)
    end
end

return control
