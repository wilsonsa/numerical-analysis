function [I, c] = gausslegendre(f, xi, a, b)
% Inputs:
%     f - anonymous function handle of function to be integrated
%     xi - vector of points to use for the Gauss-Legendre Quadrature
%     a - lower bound of the interval
%     b - upper bound of the interval
% Outputs:
%     I - value of the integral of the function
%     c - vector of the constants corresponding to xi vectors
% Ex:
% IN:
%   f = @(x)5*x^3-7*x^2+10*x-20
%   xi = [-0.577350269189626   0.577350269189626]
%   a = -1
%   b =  1
% OUT:
%   I = -44.6667
%   c = [1 1] (perhaps need this for mldivide calculation)
numPoints = length(xi);
I = 0;
a1 = (b + a)/2;
a2 = (b - a)/2;

A = zeros(length(xi));
B = zeros(length(xi),1);
for i = 1:length(xi)
   for j = 1:length(xi)
      A(i,j) = xi(j)^(i-1); 
   end
   if(mod(i,2) == 0) %isEven
       B(i) = 0;
   else              %isOdd
       B(i) = 2/i;
   end
end
c = A\B;
for i = 1:numPoints
    I = I + c(i) * f(a1+a2*xi(i)); 
end
I = I * (b-a)/2;
end