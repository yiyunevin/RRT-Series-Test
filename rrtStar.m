function [isArrived, first_iter, tree_, plan_] = rrtStar(start_, goal_, map_, obstacle_,...
                                                         radius, epsilon, max_nodes_num,...
                                                         plotTF, resolution, tolerance)
%% Definotion
tree_ = [];
plan_=[];

node_count = 0;
map_max_x = size(map_, 1);
map_max_y = size(map_, 2);

first_iter = 0;
isArrived = false;

%% Initialize Tree
node_count = node_count + 1;
node_new.x = start_(1);
node_new.y = start_(2);
node_new.node_id = node_count;
node_new.parent_id = -1;
node_new.cost = 0;

printNodeInfo(node_new, 'Add new node');
tree_ = [tree_ node_new];

%% Exploration

while node_count <= max_nodes_num 

    q_rand = SampleNode(map_max_x, map_max_y);
    nearest_id = NearestNodeStar(tree_, q_rand, isArrived, first_iter);
    q_new  = SteerNode(tree_(nearest_id).x, tree_(nearest_id).y,...
                       q_rand(1), q_rand(2), epsilon);
    
    % Collision Checking
    if ~isObstacleBetween(tree_(nearest_id).x, tree_(nearest_id).y,...
                          q_new(1), q_new(2), map_, resolution)
                     
        node_count = node_count + 1;
        tree_ = addNewNodeStar(tree_, nearest_id, q_new, node_count, radius, map_, resolution, isArrived, first_iter);
        
        if ~isArrived
            
            if plotTF
                mapIllustrateNode(size(map_), obstacle_, tree_, plan_, start_, goal_, 'RRT*');
                pause(.01);
            end
            
            if isArriveGoal(q_new(1), q_new(2), goal_(1), goal_(2), tolerance)
                
                tree_ = addNewNodeStar(tree_, node_count, goal_, node_count + 1, radius, map_, resolution, isArrived, first_iter);
                
                isArrived = true;
                node_count = node_count + 1;
                first_iter = node_count;
                
                disp('-----------------------------------------------------------------')
                disp(['Global Planner: First Path Found in the ', num2str(first_iter), 'th step.']);
                
                plan_ = pathPlanningNode(tree_, first_iter); 
                
                disp('================================================================')
                
                mapIllustrateNode(size(map_), obstacle_, tree_, plan_, start_, goal_, 'RRT*');
                pause(.01);
            end
        
        else            
            plan_ = pathPlanningNode(tree_, first_iter); 

            if plotTF
                mapIllustrateNode(size(map_), obstacle_, tree_, plan_, start_, goal_, 'RRT*');
                pause(.01);
            end
        end
    end
end

mapIllustrateNode(size(map_), obstacle_, tree_, plan_, start_, goal_, 'RRT*');

end