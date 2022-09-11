function [isArrived, tree_, plan_] = rrt(start_, goal_, map_, obstacle_, epsilon,...
                                            max_nodes_num, plotTF, resolution, tolerance)
%% Definotion
tree_ = [];
plan_=[];

node_count = 0;
map_max_x = size(map_, 1);
map_max_y = size(map_, 2);

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

while ~isArrived && node_count <= max_nodes_num 

    q_rand = SampleNode(map_max_x, map_max_y);
    nearest_id = NearestNodeStar(tree_, q_rand, false, 0);
    q_new  = SteerNode(tree_(nearest_id).x, tree_(nearest_id).y,...
                       q_rand(1), q_rand(2), epsilon);
    
    % Collision Checking
    if ~isObstacleBetween(tree_(nearest_id).x, tree_(nearest_id).y,...
                          q_new(1), q_new(2), map_, resolution)
                     
        node_count = node_count + 1;
        tree_ = addNewNode(tree_, nearest_id, q_new, node_count);
        
        if ~isArrived
            
            if plotTF
                mapIllustrateNode(size(map_), obstacle_, tree_, plan_, start_, goal_, 'RRT');
                pause(.01);
            end
                
            if isArriveGoal(q_new(1), q_new(2), goal_(1), goal_(2), tolerance) 
                isArrived = true;
                tree_ = addNewNode(tree_, node_count, goal_, node_count+1);
                
                disp('================================================================')
                disp(['Global Planner: First Path Found in the ', num2str(node_count+1), 'th step.']);
                
                plan_ = pathPlanningNode(tree_, node_count+1); 
                
                mapIllustrateNode(size(map_), obstacle_, tree_, plan_, start_, goal_, 'RRT');
            end
        end

    end
end

end