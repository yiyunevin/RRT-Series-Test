function [YN] = isArriveGoal(qx, qy, goalX, goalY, tolerance) 
    YN = false;
    
    if euclideanDistance2D(qx, qy, goalX, goalY) < tolerance
        YN = true;
    end
    
end