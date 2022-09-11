function q = SampleNodeIntelligent(map_max_x, map_max_y, plan_, b, bias_radius)

q = zeros(2, 1);

beacons = plan_(2 : end-1);

q(1) = round(beacons(b).x - bias_radius + 2 * bias_radius * rand());
q(2) = round(beacons(b).y - bias_radius + 2 * bias_radius * rand());

if q(1) > map_max_x
    q(1) = map_max_x;
elseif q(1) < 1
    q(1) = 1;
end

if q(2) > map_max_y
    q(2) = map_max_y;
elseif q(2) < 1
    q(2) = 1;
end
    

end