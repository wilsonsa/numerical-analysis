function [f] = taylor_exp_x(n,xi)

    % Insert your Taylor Series function here. 
    % Inputs: n - order of the Taylor Series, xi - the point about which to center.
    % Output: f - the anonymous function output.
    % order = n
    % f = 0
    f = @(x) exp(xi);
    
    for i = 1:n
      term = @(x) exp(xi) ./ factorial(i) .* (x-xi).^i;   
      f = @(x) f(x)+term(x);
    end
end