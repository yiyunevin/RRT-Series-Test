function [nearest_id] = NearestNodeStar(tree_, q_rand, isArrived, goal_id)

node_num = max(size(tree_));

nearest_id = tree_(1).node_id;
min_dist = euclideanDistance2D(q_rand(1), q_rand(2), tree_(1).x, tree_(1).y);

for n = 2 : node_num
    
    if isArrived
        if n == goal_id
            continue
        end
    end
    
    dist = euclideanDistance2D(q_rand(1), q_rand(2), tree_(n).x, tree_(n).y);
    if dist < min_dist
        min_dist = dist;
        nearest_id = tree_(n).node_id;
    end
end

end