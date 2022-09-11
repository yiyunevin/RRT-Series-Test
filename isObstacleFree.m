function [YN] = isObstacleFree(x, y, map)

% YN = TRUE   if node in C_obs
%    = FLASE  if node in C_free

% x = round(x);
% y = round(y);

map_max_x = size(map, 1);
map_max_y = size(map, 2);

YN = false;

% disp(['Checking Collision: (', num2str(x), ', ', num2str(y), ' )']);

if x > map_max_x || x <= 0  
	YN = true;
elseif y > map_max_y || y <= 0
    YN = true;
elseif map(x, y) > 0
    YN = true;
end

% disp(['Checking Collision: (', num2str(x), ', ', num2str(y), ' ) = ', num2str(YN)]);
    
end