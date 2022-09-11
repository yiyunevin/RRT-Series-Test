function [tree_] = addNewNodeStar(tree_, parent_id, q_new, node_id, radius, map_, resolution, isArrived, goal_id)

node_new.x = q_new(1);
node_new.y = q_new(2);
node_new.node_id = node_id;

tree_size = max(size(tree_));

% Find Parent

parent_cost = tree_(parent_id).cost +...
       euclideanDistance2D(tree_(parent_id).x , tree_(parent_id).y, ...
                           node_new.x, node_new.y);

for t = 1 : tree_size
    
    if isArrived
        if t == goal_id
            continue
        end
    end
    
    dist = euclideanDistance2D(tree_(t).x , tree_(t).y, ...
                               node_new.x, node_new.y);
    if dist < radius
        cost = tree_(t).cost + dist;
        if cost < parent_cost
            if ~isObstacleBetween(tree_(t).x , tree_(t).y, ...
                                  node_new.x, node_new.y, map_, resolution)
                parent_id = t;
                parent_cost = cost;
            end
        end
    end
end

node_new.parent_id = parent_id;
node_new.cost = parent_cost;

printNodeInfo(node_new, 'Add new node');

% rewire

for t = 1 : length(tree_)

    if tree_(t).node_id == node_new.parent_id
        continue;
    end
    
    dist = euclideanDistance2D(tree_(t).x , tree_(t).y, ...
                               node_new.x, node_new.y);
    if dist < radius
        cost = node_new.cost + dist;
        if cost < tree_(t).cost
            if ~isObstacleBetween(tree_(t).x , tree_(t).y, ...
                                  node_new.x, node_new.y, map_, resolution)
                tree_(t).parent_id = node_new.node_id;
                tree_(t).cost = cost;
                printNodeInfo(tree_(t), '>>>>> Rewire');
            end
        end
    end
end

% add to tree

tree_ = [tree_, node_new];

end