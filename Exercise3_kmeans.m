%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Human motion clustering: Expectation Maximization algorithm
% K-means clustering
% 
% Input:    the motion data, the initial cluster label and the number of
%           clusters. 
% Output:   3 plots
%
% Author: Jianyu Zhao
% Last revised: 13.06.2016
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Exercise3_kmeans(gesture_l,gesture_o,gesture_x,init_cluster_l,...
                          init_cluster_o,init_cluster_x,K)
mykmeans(gesture_l,init_cluster_l,K);
mykmeans(gesture_o,init_cluster_o,K);
mykmeans(gesture_x,init_cluster_x,K);

end