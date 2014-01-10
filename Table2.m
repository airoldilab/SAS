clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This routine reproduces the results of Table 2 
%
% Stanley Chan
% Harvard University
% Dec 28, 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath(genpath('./deconvtv_v1/'));
n = 200;       % Toggle with n = 1000;

max_trial = 50; % Our experiment sets max_trial = 50
mse_sas  = zeros(10,max_trial);
mse_usvt = zeros(10,max_trial);
mse_sba  = zeros(10,max_trial);

t_sas  = zeros(10,max_trial);
t_usvt = zeros(10,max_trial);
t_sba  = zeros(10,max_trial);

% Main Loop
for cidx = 1:10
    caseid = cidx;
    fprintf('cidx = %3g, \n', cidx);
    
    for trial=1:max_trial
        fprintf('trial = %3g, \n', trial);
        
        % Generate a graphon
        wtrue = gen_graphon(n,caseid);
        
        % Sample a random graph from the graphon
        G = construct_a_graph_from_P(wtrue,n,1);
        pidx = randperm(n);
        G = G(pidx,pidx);
        
        % Apply Sort and Smooth
        t0 = tic;
        wsas = sort_and_smooth(G);
        t_sas(cidx,trial) = toc(t0);
        
        % Apply USVT
        t1 = tic;
        wusvt = usvt(G);
        t_usvt(cidx,trial) = toc(t1);
        
        % Apply Stochastic Blockmodel Approximation
        t2 = tic;
        if trial==1
            h = oracle_h(G,wtrue);
        end
        wsba = stochastic_block(G,h);
        t_sba(cidx,trial) = toc(t2);
        
        % Record MSE
        mse_sas(cidx,trial)  = 0;%mean((wsas(:) -wtrue(:)).^2);
        mse_usvt(cidx,trial) = 0;%mean((wusvt(:)-wtrue(:)).^2);
        mse_sba(cidx,trial)  = mean((wsba(:) -wtrue(:)).^2);
    end
end

% Display results
fprintf('ID   \t SAS                     \t USVT                     \t SBA \n');
for cidx = 1:10
    fprintf('%3g \t %2.2e +/- %2.2e \t %2.2e +/- %2.2e \t %2.2e +/- %2.2e \n', cidx, ...
        mean(mse_sas(cidx,:)),  std(mse_sas(cidx,:)), ...
        mean(mse_usvt(cidx,:)), std(mse_usvt(cidx,:)), ...
        mean(mse_sba(cidx,:)),  std(mse_sba(cidx,:)));
end
