function [y,n] = trapezoid(f, g, tol_trap, tol_golden, a, b)
% Inputs:
%    f - Anonymous function handle corresponding to f(x)
%    g - Anonymous function handle corresponding to f"(x)
%    tol_trap - Maximum error for the Trapezoid Rule approximation of the integral of f(x)
%    tol_golden - Tolerance for the Golden Section Method
%    a - Lower bound of the interval
%    b - Upper bound of the interval
% Outputs:
%    y - Evaluation of the integral of f(x) using the Trapezoid Rule
%    n - number of divisions that should be used for the Trapezoid Rule

% Part 1: Max Value of g using golden section rule. 
phi=(1+sqrt(5))/2;
iter=0;
% Plot Graph
%     fig = figure;
%     hax=axes; 
%     fplot(g)
%     xlim([a,b])
%     ylim([0,4])

while(1)
% Iterate    
    d = (phi-1)*(b - a);
    x1 = a + d;
    x2 = b - d;
    if g(x1) > g(x2)
        xopt = x1;
        a = x2;
    else
        xopt = x2;
        b = x1;
    end
%     SP=xopt; %your point goes here
%     line([SP SP],get(hax,'YLim'),'Color',[1 0 0])    
    iter=iter+1;
    if xopt~=0, ea = (2 - phi) * abs((b - a) / xopt) * 100;end
    if ea <= tol_golden,break,end
end
x=xopt
maxVal=g(xopt)

% Part 2:Trapezoidal Rule. # n to meet err of tol_trap
% Use maximum value y here. 
% Here, you know value x and g(x), but this is for f''(x)...
% Truncation Error = -(1/12)*((b-a)/n)^3*f''(e)
n = (b-a)/nthroot((tol_trap/maxVal)*-12,3)


end

