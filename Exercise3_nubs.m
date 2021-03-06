%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Human motion clustering: Expectation Maximization algorithm
% Non-Uniform Binary Split Algorithm
% 
% Input:    the motion data and the number of clusters K          
% Output:   3 plots
%
% Author: Jianyu Zhao
% Last revised: 13.06.2016
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Exercise3_nubs(gesture_l,gesture_o,gesture_x,K)

    mynubs(gesture_l,K);
    mynubs(gesture_o,K);
    mynubs(gesture_x,K);

end