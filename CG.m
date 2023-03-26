function [x, niters] = CG(A, b)
%The function takes two inputs: the matrix A and the vector b.
%It returns two outputs: the solution vector x and the number of iterations niters used to solve the linear system.
n = length(b);
x = zeros(n, 1);
r = b - A*x;
p = r;
r_1 = r'*r;
niters = 0;

while r_1 > eps^2 && niters < n
    Ap = A*p;
    alpha = r_1/(p'*Ap);
    x = x + alpha*p;
    r = r - alpha*Ap;
    r_new = r'*r;
    beta = r_new/r_1;
    p = r + beta*p;
    r_1 = r_new;
    niters = niters + 1;
end