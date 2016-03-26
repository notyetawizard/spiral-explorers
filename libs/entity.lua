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

    function new:rotate(dr)
        self.shape:rotate(gmath.rangeCap(gmath.rangeWrap(dr, math.pi), self.rot_speed))
        self.shape:setRotation(gmath.rangeWrap(self.shape:rotation(), math.pi))
    end

    function new:applyForce(mx, my)
        self.mx = self.mx + mx
        self.my = self.my + my
    end

    function new:limitMotion()
        a = gmath.angleTo(self.mx, self.my)
        d = gmath.rangeCap(gmath.distanceTo(self.mx, self.my), self.max_speed)
print("a:d", a, d)
print(math.cos(a)*d, math.sin(a)*d)
        return math.cos(a)*d, math.sin(a)*d
    end
    
    function new:move()
        self.shape:move(self:limitMotion())
        self.x, self.y = self.shape:center()
    end

--Tried to solve with sine laws what could be accomplished with addition :/
--Keeping just in case, for now.
--[[
    function new:applyForce(mag, dir)
        a = math.pi - (dir - self.dir)
        nmag = math.sqrt((self.mag^2) + (mag^2) - (2*self.mag*mag*math.cos(a))) 
        ndir = math.asin(mag*math.sin(a)/nmag)
        self.mag, self.dir = nmag, ndir
        print(self.mag, self.dir)
    end

    function new:move()
        --cap all momentum;
        --may want to cap only *movement* instead, and hold the remaining momentum?
        self.mag = gmath.rangeCap(self.mag, self.max_speed)
        
        x = math.sin(self.dir)*self.mag
        y = math.cos(self.dir)*self.mag
        self.shape:move(x,y)
    end
--]]
    
    return new
end

return entity
