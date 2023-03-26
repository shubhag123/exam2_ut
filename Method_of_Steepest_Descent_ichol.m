% x0 is the initial guess for the solution
% M is the incomplete Cholesky factorization of A
% L is the lower-triangular matrix obtained from M
% The parameter maxit is the maximum number of iterations

function [x, niters] = Method_of_Steepest_Descent_ichol(A, b, x0)

L = sparse(ichol(sparse(A)));

%  set k to 0
r = b - A*x0;
k = 0;

while norm(r) > 1e-10
% Calculate p_k and q_k
p = L' \ (L \ r);
q = A*p;
alpha_k = (p'*r) / (p'*q);
x = x0 + alpha_k*p;
r = r - alpha_k*q;
k = k + 1;
x0 = x;
end
niters = k;

end