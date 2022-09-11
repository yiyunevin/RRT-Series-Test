function q = SampleNode(map_max_x, map_max_y)

q = zeros(2, 1);

q(1) = round(randi(map_max_x));
q(2) = round(randi(map_max_y));

end