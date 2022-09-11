# RRT-series-Test
MATLAB code of rrt, rrt* and smart-rrt

## Usage

Run the file 'main.m'.

---

**Parameter for Algorithm**
+ `start`: position of the start
+ `goal`: position of the goal
+ `alg`: algorithm to use ( 1 = RRT ; 2 = RRT* ; 3 = Smart RRT* )
+ `epsilon`: max step length between nodes
+ `max_nodes_num`: max number of nodes to be arranged
+ `radius`: radius for ChooseParent and Rewire in RRT*
+ `bias_radius`: for Smart-RRT*
+ `bias_step`: for Smart-RRT*

**Parameter for Scene Setting**

+ `map_size`: size of the scene
+ `obs_num`: number of obstacles (overlap is ok)
+ `obs_size_min`: minimum size of each obstacle 
+ `obs_size_max`: maximum size of each obstacle

---

## Result

| RRT | RRT* | Smart-RRT* |
| :--: | :--: | :--: |
| <img height="360" src="https://github.com/yiyunevin/RRT-series-Test/blob/main/resultImage/rrt.jpg?raw=true"> |  |  |


**RRT**<br>

<p align="center">
  <img width="40%" src="https://github.com/yiyunevin/RRT-series-Test/blob/main/resultImage/rrt.jpg?raw=true">
</p>

**RRT***<br>



**Smart-RRT***<br>
