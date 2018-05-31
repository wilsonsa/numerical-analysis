function [a, b] = expRegression(x,y)
% Given a set of dependent (y) and independent (x) variables, provide
% the coefficients and plot for a Single-Term Exponential Model, where 
% the general term is f(x) = a*exp(b*x)
n = length(x);
y2 = log(y);
j = sum(x);
k = sum(y2);
l = sum(x.^2);
m = sum(y2.^2);
r2 = sum(x .* y2);

b = (n * r2 - k * j) / (n * l - j^2)
a = exp((k-b*j)/n) 

% calculate coeff. of determination, coeff. of correlation
% and standard error of estimate
c = b * (r2 - j * k / n);
d = m - k^2 / n;
f = d - c;
cf_dt = c/d
corr = sqrt(cf_dt)
std_err = sqrt(f / (n - 2)) 

% We can calculate any point along the curve
% x = input('Interpolation: ');
% y = a * exp(b * x)

bestfit = @(n) a*exp(b*n)
fplot(bestfit)


end

