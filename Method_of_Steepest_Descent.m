function [x, niters] = Method_of_Steepest_Descent(A, b)

% Set initial values of x
len_b = length(b);
x = zeros(len_b, 1);

% Initialise convergence criterion maximum number of iterations
conv = 1e-6;
max_it = 1000;

% Find residual vector
r = b - A*x;

%initial direction
p = r;

% Perform iteration until convergence or maximum iterations reached
niters = 0;
while (norm(r) > conv) && (niters < max_it)
    % step size
    step_size = (r'*r) / (p'*A*p);
    
    % Update x
    x = x + step_size*p;
    
    % Update residual vector
    rnew = r - step_size*A*p;
    
    % Update direction
    beta = (rnew'*rnew) / (r'*r);
    p = rnew + beta*p;
    
    % Update residual and iteration counter
    r = rnew;
    niters = niters + 1;
end

end
