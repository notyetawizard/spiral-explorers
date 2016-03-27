gmath = {}

--Cap number if outside a range
function gmath.rangeCap(n,h,l)
    if n > h then return h
    elseif n < (l or -h) then return (l or -h)
    else return n
    end
end

--Wrap number if outside a range
function gmath.rangeWrap(n,h,l)
    if n > h then return (l or -h)
    elseif n < (l or -h) then return (l or h)
    else return n
    end
end

--Assume 0,0 when x2,y2 aren't given
function gmath.angleTo(x1,y1,x2,y2)
    if x2 and y2 then return math.atan2(y2 - y1, x2 - x1 )
    else return math.atan2(y1,x1)
    end
end

function gmath.distanceTo(x1,y1,x2,y2)
    if x2 and y2 then return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
    else return math.sqrt(x1^2 + y1^2)
    end
end

function gmath.vectorEnd(a,d,x2,y2)
    if x2 and y2 then 
        return x2 + math.cos(a)*d, y2 + math.sin(a)*d
    else return math.cos(a)*d, math.sin(a)*d
    end
end

function gmath.distanceTrim(max,x1,y1,x2,y2)
    a = gmath.angleTo(x1,y1,x2,y2)
    d = gmath.rangeCap(gmath.distanceTo(x1,y1,x2,y2),max)
    return gmath.vectorEnd(a,d,x2,y2)
end

return gmath
