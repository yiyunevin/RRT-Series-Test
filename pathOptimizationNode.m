function [plan, directcost] = pathOptimizationNode(tree, map_, resolution, directcost, goal_id)

directcost_new = 0;

node = tree(goal_id);
start_node = node;
plan = start_node;

%% New Planning

while node.parent_id > 0
    
    node_parent = tree(node.parent_id);
    
    if isObstacleBetween(start_node.x, start_node.y, node_parent.x, node_parent.y, map_, resolution)
        plan = [node plan];

        directcost_new = directcost_new + euclideanDistance2D(start_node.x, start_node.y, ...
                                                              node.x, node.y);
        start_node = node;
    end
    
    node = node_parent;
    
end

% append start config.

plan = [node plan];
directcost_new = directcost_new + euclideanDistance2D(start_node.x, start_node.y, ...
                                                      node.x, node.y);

%% Update Beacons
                                              
if directcost_new < directcost
    
    for b = 2 : length(plan)
        plan(b).parent_id = plan(b-1).node_id;
    end
    
    directcost = directcost_new;
    
end
                                                  
end