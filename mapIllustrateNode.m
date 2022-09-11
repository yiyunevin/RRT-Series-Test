function mapIllustrateNode(map_size, obstacle, tree, path, start, goal, algo_name)

clf;

% Map
title(sprintf('%s Path Planning Map', algo_name));
axis([0, map_size(1), 0, map_size(2)]);
xlabel('x');    ylabel('y');
for s = 1 : size(obstacle, 1)
    rectangle('position', [obstacle(s,1),obstacle(s,2),obstacle(s,3),obstacle(s,4)],...
              'facecolor', 'black');
    hold on;
end

% Tree

if ~isempty(tree)

    for t = 1 : length(tree)
        %scatter(tree(t).x, tree(t).y, 25, 'filled', 'MarkerFaceColor','#80B3FF');
        if tree(t).parent_id > 0
            plot([tree(t).x, tree(tree(t).parent_id).x],...
                 [tree(t).y, tree(tree(t).parent_id).y,],...
                 'Marker', '.', 'Color', '#80B3FF');
            hold on;
        end
    end

end

% Path
if ~isempty(path)
    % path
    for p = 2 : length(path)
        plot([path(p).x, path(p-1).x], [path(p).y, path(p-1).y], 'LineWidth', 2.5, 'Color', 'blue');
        hold on;
    end
   
end

% Start / Goal
scatter(start(1), start(2), 65, 'filled', 'green');
hold on;
scatter(goal(1), goal(2), 65, 'filled', 'red');
hold on;

end

