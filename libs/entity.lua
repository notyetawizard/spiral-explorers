range = require "libs/range"
HC = require "libs/HC"

entity = {}


--Return the angle from an entity's center to a point;
--relative to it's own rotation if rel == true
function entity:angleTo(x,y,rel)
    sx, sy = self.shape:center()
    a = math.atan2(y - sy, x - sx )
    if rel == true then return a - self.shape:rotation()
    else return a
    end
end

function entity:rotate(dr)
    self.shape:rotate(range.cap(range.wrap(dr, math.pi), self.rot_speed))
    self.shape:setRotation(range.wrap(self.shape:rotation(), math.pi))
end

function entity:applyForce()
    
end

function entity:move()
    --self.shape:move(x,y)
end

function entity.new()
    new = {
        shape = shape,
        acl_speed = acl_speed,
        max_speed = max_speed,
        rot_speed = rot_speed
        momentum = momentum
    }
    
end

explorer = {
    shape = HC.polygon(0,0, 12,0, 16,8, 12,16, 0,16),
    color = {0, 128, 128, 255},
    aspeed = 0.5,
    mspeed = 2,
    rspeed = 0.12,
    moment = {0,0},
}
return entity
