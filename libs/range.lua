range = {}

--Cap number if outside a range
function range.cap(n,h,l)
    if n > h then return h
    elseif n < (l or -h) then return (l or -h)
    else return n
    end
end

--Wrap number if outside a range
function range.wrap(n,h,l)
    if n > h then return (l or -h)
    elseif n < (l or -h) then return (l or h)
    else return n
    end
end

return range
