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
clearvars;

load('gesture_dataset.mat');

mykmeans(gesture_l,init_cluster_l);
mykmeans(gesture_o,init_cluster_o);
mykmeans(gesture_x,init_cluster_x);

