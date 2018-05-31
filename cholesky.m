function [x, R, Rtranspose] = cholesky(A,b)
    % Inputs:
    %    A - square matrix of size n x n
    %    b - vector of size n x 1
    % Outputs:
    %    x - solution vector of size n x 1
    %    R - Cholesky factor
    %    Rtranspose - Transpose of Cholesky factor
    n = length(A);
    R = zeros(n, n);
    b = [sum(A(1,:)); sum(A(2,:)); sum(A(3,:))]
    for i=1:n
        R(i, i) = sqrt(A(i, i) - R(i, :)*R(i, :)');
        for j=(i + 1):n
            R(j, i) = (A(j, i) - R(i,:)*R(j ,:)')/R(i, i);
        end
    end
    Rtranspose = R;
    R = R'
    
    d = Rtranspose\b;
    x = R\d;
end