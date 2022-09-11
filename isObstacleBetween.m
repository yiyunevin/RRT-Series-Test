function [YN] = isObstacleBetween(Ax, Ay, Bx, By, map, resolution)

YN = false;

distAB = euclideanDistance2D(Ax, Ay, Bx, By);

if distAB >= resolution
    steps = floor(distAB / resolution);
    theta = atan2( (By - Ay), (Bx - Ax) );
    
    for s = 1 : steps
        exam(1) = round(Ax + s * resolution * cos(theta));
        exam(2) = round(Ay + s * resolution * sin(theta));
        if isObstacleFree(exam(1), exam(2), map)
            YN = true;
            break
        end
    end
end

if isObstacleFree(Bx, By, map)
    YN = true;
end

end