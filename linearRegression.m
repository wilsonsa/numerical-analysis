function linearRegression(x,y)
% Use Linear least squares fit to determine Coefficients 
% for best fit line y = alpha*exp(beta * x)
    scatter(x,y,'filled')
    xsq = x.^2;
    xy_prod = x.*y;
    x_mean = findMean(x);
    y_mean = findMean(y);
    
    slope = (numel(x)*sum(xy_prod) - sum(x)*sum(y))/(numel(x)*sum(xsq)-sum(x)^2);
    intercept = y_mean - slope*x_mean;
    bestfit = @(b) slope*b + intercept;
    fplot(bestfit)
end

function m = findMean(x)
    m = sum(x)/numel(x);
end