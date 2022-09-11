function [tree_] = addNewNode(tree_, parent_id, q_new, node_id)

node_new.x = q_new(1);
node_new.y = q_new(2);
node_new.node_id = node_id;

parent_cost = tree_(parent_id).cost +...
       euclideanDistance2D(tree_(parent_id).x , tree_(parent_id).y, ...
                           node_new.x, node_new.y);

node_new.parent_id = parent_id;
node_new.cost = parent_cost;

printNodeInfo(node_new, 'Add new node');

tree_ = [tree_, node_new];

end