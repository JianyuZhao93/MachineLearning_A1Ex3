%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Human motion clustering: Expectation Maximization algorithm
% Main function

%
% Author: Jianyu Zhao
% Last revised: 13.06.2016
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars;

load('gesture_dataset.mat');
K = size(init_cluster_l,1);
Exercise3_kmeans(gesture_l,gesture_o,gesture_x,init_cluster_l,...
                          init_cluster_o,init_cluster_x,K);
Exercise3_nubs(gesture_l,gesture_o,gesture_x,K);
