gmath = require "libs/gmath"
HC = require "libs/HC"

entity = {}

function entity.new(x, y, shape_type, shape_points, color, stats)
    new = {
        x = x,
        y = y,
        shape = HC[shape_type](unpack(shape_points)),
        color = color,
        vx = stats.vx or 0,
        vy = stats.vy or 0,
        mass = stats.mass or 0,
        mov_force = stats.mov_force or 0,
        max_velocity = stats.max_velocity or 0,
        rot_force = stats.rot_force or 0
    }
    new.shape:moveTo(new.x, new.y)
    
    function new:push(a,d)
        dx, dy = gmath.vectorEnd(a, d/self.mass)
        self.vx = self.vx + dx 
        self.vy = self.vy + dy
    end

    function new:rotateTo(x,y)
        dr = gmath.angleTo(self.x, self.y, x, y) - self.shape:rotation()
        self.shape:rotate(gmath.rangeCap(gmath.rangeWrap(dr, math.pi), self.rot_force))
        --correct for shape over rotating;
        --there is almost *definitely* a better way
        self.shape:setRotation(gmath.rangeWrap(self.shape:rotation(), math.pi))
    end

    new.friction = 0.98
    
    function new:move()
        --if there's a collision, stop
        --cast ray before move, to check for collision and stop *just* before.
        --maybe apply force from collision to object, like a bounce?
        --or a "normal force" or whatever
        --push other objects on collision, if pushable
        
        self:push(gmath.angleTo(self.vx, self.vy), -gmath.distanceTo(self.vx, self.vy)*self.friction)
        --trim velocity *and* momentum to prevent stuff from going too fast;
        --may need to change it?
        self.vx, self.vy = gmath.distanceTrim(self.max_velocity, self.vx, self.vy)
        self.shape:move(self.vx, self.vy)
        self.x, self.y = self.shape:center()
    end
    
    return new
end

return entity
