function A = Create_Poisson_problem_A(N)
% Creates the matrix A for the Poisson problem on a unit square.
%N = input("Enter N:")
%Space grid
h = 1/(N+1);

% Construct the diagonal entries.
diagonal = -4*ones(N*N,1);

% Construct the off-diagonal entries .
x_direction = ones(N*N,1);
for i = 2:N
    x_direction((i-1)*N+1:i*N) = 1-h^2;
end

y_direction = ones(N*N,1);
for i = 1:N-1
    y_direction(i*N+1:(i+1)*N) = 1-h^2;
end

% Rewrite the matrix A.
A = spdiags([diagonal, y_direction, x_direction, y_direction, x_direction],...
            [-N,-1,0,1,N], N*N, N*N);
end

%{ Another method could be
%% create slightly oversized, empty arrays
%nzA = zeros(5*N^2,1);
%ic = zeros(5*N^2,1);
%ir = zeros(N^2+1,1);
% begin count of nonzero values
%nz_counter = 1;
% we iterate over all the rows
%for i = 1:N^2
% update the array containing
% the number of nonzeroes prior to
% the current row
%ir(i) = nz_counter;
% compute the nonzeros in the row (n),
% the number of nonzeros in the row (r),
% and the column indices of those values (c)
%[n, r, c] = compute_row_update(i, N);
% update the array containing all
% nonzero entries.
%nzA(nz_counter:nz_counter + r - 1) = n;
% update the array containing the
% column indices of nonzero values
%ic(nz_counter:nz_counter + r - 1) = c;
% increase the count of nonzero values
%nz_counter = nz_counter + r;
%end
% finish count of nonzero values
%ir(end,1) = nz_counter;
% truncate unused entries
%nzA = nzA(1:ir(end,1)-1);
%ic = ic(1:ir(end,1)-1);
%end

%}