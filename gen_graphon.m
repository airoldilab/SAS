function wtrue = gen_graphon(n, caseid)    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% w = gen_graphon(n, caseid)
% generates an n-by-n graphon
% 
% input: n - number of nodes
%        caseid - case id (in [1, 10])
%
% output: w - graphon
%
% Stanley Chan
% Harvard University
% Dec 28, 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I = linspace(0,1,n);
J = linspace(0,1,n);
[I J] = meshgrid(I,J);

w = zeros(n,n);
switch caseid
    case 1
        w = I.*J;
    case 2
        w = exp(-(I.^0.7 + J.^0.7));
    case 3
        w = 0.25*(I.^0.5+I.^2 + J.^0.5+J.^2);
    case 4
        w = 0.5*(I + J);
    case 5
        w = 1./( 1 + exp(10*(I.^2 + J.^2)));
    case 6
        w = abs(I-J);
    case 7
        w = 1./( 1 + exp(-(max(I,J).^2 + min(I,J).^4)));
    case 8
        w = exp(-(max(I,J).^0.75 ));
    case 9
        w = exp(-( 0.5*min(I,J) + 0.5*(I.^0.5+J.^0.5)));
    case 10
        w = log( 1 + 0.5*max(I,J));
end

% Make sure graphon has decreasing degree
[~, pos] = sort(sum(w),'descend');
wtrue  = w(pos,pos);