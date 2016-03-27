gmath = require "libs/gmath"
HC = require "libs/HC"

entity = {}

function entity.new(x, y, shape_type, shape_points, color, stats)
    new = {
        x = x,
        y = y,
        shape = HC[shape_type](unpack(shape_points)),
        color = color,
        mx = stats.mx or 0,
        my = stats.my or 0,
        acl_speed = stats.acl_speed or 0,
        max_speed = stats.max_speed or 0,
        rot_speed = stats.rot_speed or 0
    }
    new.shape:moveTo(new.x, new.y)

    --Return the angle from an entity's center to a point;
    --relative to it's own rotation if rel == true
    --NEEDS A REWRITE
    --[[
    function new:angleTo(x,y,rel)
        if rel == true then return gmath.angleTo(x,y) - self.shape:rotation()
        else return gmath.angleTo(x,y)
        end
    end
    
    function new:distanceTo(x,y)
        return gmath.distanceTo(x,y)
    end
    --]]
    
    function new:push(angle, magnitude)
        mx, my = gmath.vectorEnd(angle, magnitude)
        self.mx = self.mx + mx 
        self.my = self.my + my
    end

    function new:rotateTo(mx, my)
        dr = gmath.angleTo(self.x, self.y, mx, my) - self.shape:rotation()
        self.shape:rotate(gmath.rangeCap(gmath.rangeWrap(dr, math.pi), self.rot_speed))
        --correct for shape over rotating;
        --there is almost *definitely* a better way
        self.shape:setRotation(gmath.rangeWrap(self.shape:rotation(), math.pi))
    end

    function new:move()
        self.shape:move(gmath.distanceTrim(self.max_speed, self.mx, self.my))
        self.mx, self.my = self.mx*0.8, self.my*0.8
        self.x, self.y = self.shape:center()
    end
    
    return new
end

return entity
