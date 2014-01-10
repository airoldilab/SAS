clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This routine reproduces the results of Figure 3
%
% Stanley Chan
% Harvard University
% Dec 28, 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%========= Load Package ===========%
addpath(genpath('./deconvtv_v1/'));


%========= Experiment Setup =======%
n = 1000;                                    % Number of nodes
caseid = 1;                                 % Graphon ID
wtrue = gen_graphon(n,caseid);              % Generate a graphon
G = construct_a_graph_from_P(wtrue,n,1);    % Sample a random graph
pidx = randperm(n);                         % Randomly permute col/row
G = G(pidx,pidx);





%========= Sort and Smooth (Proposed) ====%
t0    = tic;
wsas  = sort_and_smooth(G);
t_sas = toc(t0);

%========= USVT (Chatterjee 2012) ========%
t1     = tic;
wusvt  = usvt(G);
t_usvt = toc(t1);

%========= SBA (Airoldi et al. 2013) =====%
t2    = tic;
h_opt = oracle_h(G,wtrue);
wsba  = stochastic_block(G,h_opt);
t_sba = toc(t2);





%========= Display Result =====%
Fig = figure(1);
imagesc(wtrue); axis image; axis off;
export_fig wtrue_1.eps -transparent

Fig = figure(2);
imagesc(wsas); axis image; axis off;
export_fig wsas_1.eps -transparent

Fig = figure(3);
imagesc(wusvt); axis image; axis off;
export_fig wusvt_1.eps -transparent

Fig = figure(4);
imagesc(wsba); axis image; axis off;
export_fig wsba_1.eps -transparent


