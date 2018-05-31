function [b,y1] = NewtInt(x,y,x1)
% Newtint: Newton interpolating polynomial
% yint = Newtint(x,y,x1): Uses an (n - 1)-order Newton
% interpolating polynomial based on n data points (x, y)
% to determine a value of the dependent variable (yint)
% at a given value of the independent variable, x1.
% input:
% x = independent variable
% y = dependent variable
% x1 = value of independent variable at which
% interpolation is calculated
% output:
% yint = interpolated value of dependent variable
% compute the finite divided differences in the form of a
% difference table
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
b = zeros(n,n);
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.
for j = 2:n
    for i = 1:n-j+1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end
% use the finite divided differences to interpolate
y1 = zeros(1,length(x1));
for k = 1:length(x1)
    yint = b(1,1);
    xt = 1;
    for j = 1:n-1
        xt = xt*(x1(k)-x(j));
        yint = yint+b(1,j+1)*xt;
    end
    y1(k) = yint;
end