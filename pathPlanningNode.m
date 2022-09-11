function [plan] = pathPlanningNode(tree, goal_id)

plan = [];

node = tree(goal_id);
plan = [node plan];

% disp('=========================== Find Path ===========================')
% disp(['Path Beacons : node ', num2str(node.node_id),...
%                   ' ; parent = ', num2str(node.parent_id),...
%                   ' ; x = ', num2str(node.x),...
%                   ' ; y = ', num2str(node.y)]);

while node.parent_id > 0

    node = tree( node.parent_id );
    plan = [node plan];
    
%     disp(['Path Beacons : node ', num2str(node.node_id),...
%                       ' ; parent = ', num2str(node.parent_id),...
%                       ' ; x = ', num2str(node.x),...
%                       ' ; y = ', num2str(node.y)]);
    
end

end