gmath = require "libs/gmath"
HC = require "libs/HC"

entity = {}

function entity.new(x, y, shape_type, shape_points, color, stats)
    new = HC[shape_type](unpack(shape_points))

    new.x = x
    new.y = y
    new:moveTo(new.x, new.y)

    --waste of a table; fix this
    if not stats then stats = {} end
    new.color = color
    new.vx = stats.vx or 0
    new.vy = stats.vy or 0
    new.mass = stats.mass or 0
    new.mov_force = stats.mov_force or 0
    new.max_velocity = stats.max_velocity or 0
    new.rot_force = stats.rot_force or 0
    
    function new:push(a,d)
        dx, dy = gmath.vectorEnd(a, d/self.mass)
        self.vx = self.vx + dx 
        self.vy = self.vy + dy
    end

    function new:rotateTo(x,y)
        dr = gmath.angleTo(self.x, self.y, x, y) - self:rotation()
        self:rotate(gmath.rangeCap(gmath.rangeWrap(dr, math.pi), self.rot_force))
        --correct for shape over rotating;
        --there is almost *definitely* a better way
        self:setRotation(gmath.rangeWrap(self:rotation(), math.pi))
    end

    new.friction = 0.98
    
    function new:update()
        --apply frictions
        self:push(gmath.angleTo(self.vx, self.vy), -gmath.distanceTo(self.vx, self.vy)*self.friction)
        --trim velocity and momentum (may need to change this?)
        self.vx, self.vy = gmath.distanceTrim(self.max_velocity, self.vx, self.vy)
        self:move(self.vx, self.vy)
        
        --get collisions
        local colls = HC.collisions(self)
        for other, v in pairs(colls) do
            --divide up mass and vectors
            --won't work as the entity isn't returned, just the shape :/
            total_mass = self.mass + other.mass
            self:move(v.x*(other.mass/total_mass), v.y*(other.mass/total_mass))
            other:move(-v.x*(self.mass/total_mass), -v.y*(self.mass/total_mass))
        end
        
        --if there's a collision, stop
        --maybe apply force from collision to object, like a bounce?
        --or a "normal force" or whatever
        --push other objects on collision, if pushable
        
        self.x, self.y = self:center()
    end
    
    return new
end

return entity
