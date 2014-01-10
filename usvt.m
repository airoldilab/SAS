function W = usvt(G)
d = mean(G);
[~, pos] = sort(d,'descend');
A = G(pos,pos);
    
n = size(A,1);
Y = mean(A,3);

[U S V] = svd(Y);

idx = (diag(S)<1.01*sqrt(n));

s1 = diag(S);
s1(idx) = 0;
W = U*diag(s1)*V';

W(W>1) = 1;
W(W<0) = 0;

