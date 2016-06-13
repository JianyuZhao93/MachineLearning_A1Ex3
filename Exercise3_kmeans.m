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
K = 7;

gesture = gesture_l;
init = init_cluster_l;
n = size(gesture,1)*size(gesture,2);
converged = 0;
it = 0;% iteration times counter
disto = inf;% distortion

X = reshape(gesture,[n,3])';
Y = init';

% iteration part
while ~converged
    it = it+1;
    
    label = zeros(n,1);
    num = zeros(K,1);
    for j=1:n
        dis = zeros(K,1);
        Xj = X(:,j);
        for k=1:K
            dis(k) = norm(Xj-Y(:,k));
        end
        [min_dis,label(j)] = min(dis);
        num(label(j)) = num(label(j))+1;
    end

    clusters = cell(K,1);
    [label,idx] = sort(label);
    X = X(:,idx);
    cl_end = 0;% ending of the current cluster
    for k=1:K
        b1 = cl_end + 1;
        b2 = cl_end + num(k);
        clusters{k} = X(:,b1:b2);
        Y(:,k) = mean(clusters{k}')';
        cl_end = b2;
    end
    
    disto_old = disto;
    disto = 0;
    for k=1:K
        Yk = Y(:,k);
        for i=1:num(k)
            Xi = clusters{k}(:,i);
            disto = disto + (Xi-Yk)'*(Xi-Yk);
        end
    end
    fprintf('Iteration: %d, distortion: %f\n', it, disto)
    
    if (disto_old-disto) < 1e-6
        converged = 1;
        fprintf('Final distortion: %f\n', disto)
    elseif isnan(disto)
        break
    end
end

%% visualization
color = ['b','k','r','g','m','y','c'];
figure;
for k=1:K
    cluster = clusters{k};
    scatter(cluster(1,:),cluster(2,:),[],color(k));
    hold on;
end
