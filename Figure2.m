clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This routine reproduces the results of Figure 2
%
% Stanley Chan
% Harvard University
% Dec 28, 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%========= Load Package ===========%
addpath(genpath('./deconvtv_v1/'));



%========= Experiment Setup =======%
n = 500;                                    % Number of nodes
caseid = 4;                                 % Graphon ID
wtrue = gen_graphon(n,caseid);              % Generate a graphon
G = construct_a_graph_from_P(wtrue,n,1);    % Sample a random graph
pidx = randperm(n);                         % Randomly permute col/row
G = G(pidx,pidx);


%========= Sort and Smooth ========%
[M0 N0] = size(G);
n = M0;
h = round(log(n));

% Empirical Degree Sorting
d = mean(G);
[~, pos] = sort(d,'ascend');
A = G(pos,pos);

% Histogram
H = imfilter(A, ones(h)/h^2, 'symmetric');
H = H(1:h:end, 1:h:end);

% TV
opts.beta    = [1 1 0];
opts.print   = false;
opts.method  = 'l2';
[M N] = size(H);
M2   = round(M/2);
N2   = round(N/2);
Hpad = padarray(H, [M2 N2], 'symmetric');

out  = deconvtv(Hpad,1,7.5,opts);
what = out.f;
wtv  = what(M2+1:end-M2, N2+1:end-N2);

west = imresize(wtv,[M0,N0],'nearest');





%========= Display Results ========%
Fig = figure(1);
imagesc(G); axis image; colormap(gray);
export_fig Illustration_G.eps -transparent

Fig = figure(2);
imagesc(A); axis image; colormap(gray);
export_fig Illustration_A.eps -transparent


Fig = figure(3);
imagesc(H); axis image;
export_fig Illustration_H.eps -transparent

Fig = figure(4);
imagesc(wtv); axis image;
export_fig Illustration_wtv.eps -transparent



