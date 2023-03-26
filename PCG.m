function [ x, niters ] = PCG( A, b, x0 )
L = sparse(ichol(sparse(A), struct('type', 'ict', 'droptol', 1e-2)));
% Initialize variables
x = x0;
r = b - Ax;
z = L'(L\r);
p = z;
niters = 0;
while norm(r) > tol
niters = niters + 1;
q = Ap;
alpha = (p'z)/(p'q);
x = x + alphap;
r_new = r - alphaq;
z_new = L'(L\r_new);
beta = (z_new'*q)/(z'q);
p = z_new + betap;
r = r_new;
z = z_new;
end
end