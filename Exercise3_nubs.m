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

clearvars;

load('gesture_dataset.mat');
K = 7;

gesture = gesture_l;
n = size(gesture,1)*size(gesture,2);
%label = zeros(n,1);
y = zeros(K-1,3);
clusters = cell(K,1);

% initialization
X = reshape(gesture,[n,3]);
disto = zeros(K,1);
clusters{1} = X;
y(1,:) = mean(X);

% loop for spliting
for k=1:K-1
    %choose a class with the largest distortion
    [mdisto,i] = max(disto(1:k));
    J = clusters{i};
    m = size(J,1);
    
    % split the class into two subclasses
    v = [0.08 0.05 0.02];
    clusters{i} = [];
    for j=1:m
        Xj = J(j,:);
        dis1 = norm(Xj-y(i,:)-v);
        dis2 = norm(Xj-y(i,:)+v);
        if dis1<dis2
            clusters{i} = [clusters{i};Xj];
        else
            clusters{k+1} = [clusters{k+1};Xj];
        end
    end

    % update the code vectors
    y(i,:) = mean(clusters{i});
    y(k+1,:) = mean(clusters{k+1});
    
    % update the distortion
    m1 = size(clusters{i},1);
    m2 = size(clusters{k+1},1);
    disto(i) = 0;
    for l=1:m1
        Xl = clusters{i}(l,:);
        disto(i) = disto(i) + (Xl-y(i,:))*(Xl-y(i,:))';
    end
    for l=1:m2
        Xl = clusters{k+1}(l,:);
        disto(k+1) = disto(k+1) + (Xl-y(k+1,:))*(Xl-y(k+1,:))';
    end    

end

    %% visualization
    color = ['b','k','r','g','m','y','c'];
    figure;
    for k=1:K
        cluster = clusters{k};
        scatter(cluster(:,1),cluster(:,2),[],color(k));
        hold on;
    end
