function [X_int] = newton_method(a,b,c,d,e,X_start,tol)
% coefficents of x^2 of the two equations given as a column vector
% coefficents of y^2 of the two equations given as a column vector    
% coefficents of x of the two equations given as a column vector
% coefficents of y of the two equations given as a column vector
% constants of the two equations given as a column vector
% X_start - Starting guess for Newton's Method
% tol - Tolerance value for root finding. Terminate when the 2-norm of the guess is less than tolerance
% Inputs: x = [x,y] ; 
%         a = [a1 a2]; b = [b1 b2]; c = [c1 c2]; d = [d1 d2]; e = [e1 e2] 
%       tol = [tol]
% Output: 
b = @(x) [a(1)*x(1)^2 + b(1)*x(2)^2 + c(1)*x(1) + d(1)*x(2) + e(1); ...
    a(2)*x(1)^2 + b(2)*x(2)^2 + c(2)*x(1) + d(2)*x(2) + e(2)];
A = @(x) [2*a(1)*x(1)+c(1) 2*b(1)*x(2)+d(1) ; ...
    2*a(2)*x(1)+c(2) 2*b(2)*x(2)+d(2)];
err = 1;
X_int = X_start;
while (1)
    dx = -A(X_int)\b(X_int); %solve
    X_int = X_int + dx;
    err = norm(b(X_int));
    if(err <= tol);break;end
end
end