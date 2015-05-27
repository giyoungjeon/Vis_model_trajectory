% Visualization of Model Trajectory during Learning
% Loads learning trajectory generated by train_MNIST.m,
% Plot them comparing pre-trained ('o') and not ('x').
% Learning proceeds from blue to cyan.
% 
% Written by Giyoung Jeon
% Probabilistic Artificial Intelligence Lab at UNIST
% v1.1 May, 27th, 2015

addpath(genpath('./'));

sample_N = 1000;
numbatches = 600;
idx = randperm(60000);
colmap = [zeros(1,numbatches); ((1:numbatches)-1)/(numbatches-1); ((2*numbatches-1):-1:numbatches)/(2*numbatches)]';
figure;
for pt=1:2
    if(pt==1)
        prefix = 'pre_trained_';
    else
        prefix = 'no_pre_trained_';
    end
    
    for batch=1:600
        load(strcat('./Comp_data/',prefix,int2str(batch),'.mat'));
        tmp1 = tsne(tmp(idx(1:100),:),[],2,10,30);
        if(pt==1)
            plot(tmp1(:,1),tmp1(:,2),'o','Color',colmap(batch,:));
        else
            plot(tmp1(:,1),tmp1(:,2),'x','Color',colmap(batch,:));
        end
        hold on;
    end
end