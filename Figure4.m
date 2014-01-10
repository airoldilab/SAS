clear all
close all
clc

addpath(genpath('./deconvtv_v1/'));
n_set = round(logspace(log10(100),log10(2500),50));

mse_sas  = zeros(10,length(n_set));
mse_usvt = zeros(10,length(n_set));
mse_sba  = zeros(10,length(n_set));

t_sas  = zeros(10,length(n_set));
t_usvt = zeros(10,length(n_set));
t_sba  = zeros(10,length(n_set));


% Main Loop
for cidx = 1:1
    caseid = cidx;
    fprintf('cidx = %3g, \n', cidx);
    
    for nidx=1:length(n_set)
        fprintf('nidx = %3g, \n', nidx);
        
        % Generate a graphon
        n     = n_set(nidx);
        wtrue = gen_graphon(n,caseid);
        
        % Sample a random graph from the graphon
        G = construct_a_graph_from_P(wtrue,n,1);
        pidx = randperm(n);
        G = G(pidx,pidx);
        
        % Apply Sort and Smooth
        t0 = tic;
        wsas = sort_and_smooth(G);
        t_sas(cidx,nidx) = toc(t0);
        
        % Apply USVT
        t1 = tic;
        wusvt = usvt(G);
        t_usvt(cidx,nidx) = toc(t1);
        
        % Apply Stochastic Blockmodel Approximation
        t2 = tic;
        wsba = stochastic_block(G,round(log(n)));
        t_sba(cidx,nidx) = toc(t2);
        
        % Record MSE
        mse_sas(cidx,nidx)  = mean((wsas(:) -wtrue(:)).^2);
        mse_usvt(cidx,nidx) = mean((wusvt(:)-wtrue(:)).^2);
        mse_sba(cidx,nidx)  = mean((wsba(:) -wtrue(:)).^2);
    end
end

Fig = figure(1);
plot(n_set(1:2:end), mean(t_sas(:,1:2:end)),  '-x',  'LineWidth',2); hold on; 
plot(n_set(1:2:end), mean(t_usvt(:,1:2:end)), 'r-o', 'LineWidth',2); 
plot(n_set(1:2:end), mean(t_sba(:,1:2:end)),  'k-^',  'LineWidth',2);
grid on;
xlabel('n');
ylabel('Runtime (Seconds)');
legend('SAS (proposed)','USVT','SBA','Location','NW');
% export_fig runtime.eps -transparent
