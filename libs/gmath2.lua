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

--Assume 0,0 when x1,y1 aren't given
function gmath.angleTo(x2,y2,x1,y1)
    return math.atan2(y2 - (y1 or 0), x2 - (x1 or 0)
end

function gmath.distanceTo(x2,y2,x1,y1)
    return math.sqrt((x2 - (x1 or 0))^2 + (y2 - (y1 or 0))^2)
end

function gmath.vectorEnd(a,d,x1,y1)
    return  math.cos(a)*d + (x1 or 0), math.sin(a)*d + (y1 or 0)
end

function gmath.distanceTrim(max,x2,y2,x1,y1)
    a = gmath.angleTo(x2,y2,x1,y1)
    d = gmath.rangeCap(gmath.distanceTo(x2,y2,x1,y1),max)
    return gmath.vectorEnd(a,d,x1,y1)
end

return gmath
