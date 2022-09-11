function [q_new] = SteerNode(nearX, nearY, randX, randY, step)

q_new = zeros(2,1);

dist = euclideanDistance2D(nearX, nearY, randX, randY);

if dist < step
    q_new(1) = randX;
    q_new(2) = randY;
else
    theta = atan2( randY-nearY , randX-nearX );
    q_new(1) = nearX + step * cos(theta);
    q_new(2) = nearY + step * sin(theta);
end

q_new(1) = round(q_new(1));
q_new(2) = round(q_new(2));

end