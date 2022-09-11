clear; close all; clc;
%% Parameters
start = [5, 5];
goal  = [70, 65];
alg = 3;    % 1=rrt ; 2=rrt* ; 3=smart-rrt*
radius = 10;
epsilon = 10;
tolerance = 10;
max_nodes_num = 250;
resolution = 1;
bias_radius = 7;
bias_step = 5;

%% Map Generation
map_size = [100 , 75];
obs_num = 12;
obs_size_min = 5;
obs_size_max = 20;
[map, obstacle] = mapSquareGenerationRandom(map_size, obs_num, obs_size_min, obs_size_max, start, goal);

%% RRT-start
path = [];
tree = [];
plotTF = true;

% Raw RRT Algorithm
if alg == 1
    [success, tree_, plan_] = rrt(start, goal, map, obstacle, epsilon, max_nodes_num, plotTF, resolution, tolerance);
end
% RRT-Star Algorithm
if alg == 2
    [success, first_iter, tree_, plan_] = rrtStar(start, goal, map, obstacle, radius, epsilon, max_nodes_num, plotTF, resolution, tolerance);
end
% RRT-Star Smart Algorithm
if alg == 3
    [success, first_iter, tree_, plan_] = rrtStarSmart(start, goal, map, obstacle, radius, epsilon, max_nodes_num, plotTF, resolution, tolerance, bias_radius, bias_step);
end

disp('================================================================')
disp('Global Path Planning Completed.')

if success
    disp('Success.')
end