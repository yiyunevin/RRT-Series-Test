function [map, obstacle] = mapSquareGenerationRandom(map_size, obs_num, obs_min, obs_max, start, goal)

map = zeros(map_size(1), map_size(2));

%  x -- y -- w -- h
min = [ 1 , 1 , obs_min , obs_min ];
max = [ map_size(1) , map_size(2) , (obs_max-obs_min) , (obs_max-obs_min) ];

% obstacle = round( min + max .* rand( obs_num, 4 ) );

obstacle = [];

fprintf('=========================== Obstacles ===========================\n');

for s = 1 : obs_num
    
    obs = round( min + max .* rand( 1, 4 ) );
    
    while (start(1) >= obs(1) && start(2) >= obs(2) && ...
           start(1) <= obs(1)+obs(3) && start(2) <= obs(2)+obs(4)) || ...
          (goal(1) >= obs(1) && goal(2) >= obs(2) && ...
           goal(1) <= obs(1)+obs(3) && goal(2) <= obs(2)+obs(4))
      
          obs = round( min + max .* rand( 1, 4 ) );

    end
    
    obstacle = [ obstacle ; obs ];
    
    fprintf('%d : Left x = %d ; Left y = %d ; Width = %d ; Height : %d \n',...
            s, obs(1), obs(2), obs(3), obs(4) );
    
    for w = 1 : obs(3)
        for h = 1 : obs(4)
            map(obs(1)+w, obs(2)+h) = 1;      % occupied
        end
    end
end

disp('================================================================')

end