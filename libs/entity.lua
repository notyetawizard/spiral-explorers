range = require "libs/range"
HC = require "libs/HC"

entity = {}

function entity.new(shape_type, shape_points, color, stats)
    new = {
        shape = HC[shape_type](unpack(shape_points)),
        color = color,
        momentum = stats.momentum or 0,
        acl_speed = stats.acl_speed or 0,
        max_speed = stats.max_speed or 0,
        rot_speed = stats.rot_speed or 0
    }

    --Return the angle from an entity's center to a point;
    --relative to it's own rotation if rel == true
    function new:angleTo(x,y,rel)
        sx, sy = self.shape:center()
        a = math.atan2(y - sy, x - sx )
        if rel == true then return a - self.shape:rotation()
        else return a
        end
    end

    function new:rotate(dr)
        self.shape:rotate(range.cap(range.wrap(dr, math.pi), self.rot_speed))
        self.shape:setRotation(range.wrap(self.shape:rotation(), math.pi))
    end

    function new:applyForce()
        
    end

    function new:move()
        --self.shape:move(x,y)
    end
    
    return new
end

return entity
