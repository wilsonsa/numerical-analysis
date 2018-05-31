function [ymax, tmax, h, yvec, tvec] = gradeuler(f,dfdt,df2dt2,df2dtdy,alpha,yint,tint,tol_grad,ylim,tlim,trunc,ystart,tstart,n)

% Inputs:
%   f - anonymous function of the form g(t,y) corresponding to the derivative of y with respect to t
%     dfdt - anonymous function of the form g(t,y) corresponding to the derivative of f with respect to to
%     df2dt2 - anonymous function of the form g(t,y) corresponding to the second derivative of f with respect to t
%     df2dtdy - anonymous function of the form g(t,y) corresponding to the second derivative of f with respect to t and y
%   alpha - Gradient Descent step constant
%   yint - initial y value for Gradient Descent
%   tint - initial t value for Gradient Descent
%   tol_grad - tolerance for Gradient Descent convergence
%   ylim - Vector containing the limits of y for Gradient Descent
%   tlim - Vector containing the limits of t for Gradient Descent
%     trunc - Maximum truncation error for Euler's method
%     ystart - Starting y value for Euler's method
%     tstart - Starting t value for Euler's method
%     n - Number of values to calculate using Euler's method
% Outputs:
%     ymax - y value at which the maximum of dfdt occurs
%     tmax - t value at which the maximum of dfdt occurs
%     h - Calculated step size for Euler's method
%     yvec - Vector of y's calculated using Euler's method
%     tvec - Vector of t's calculated using Euler's method
ycur = yint;
tcur = tint;
while(1)
    %Gradient Descent calculation for y and t separately
    ynext = ycur + alpha*df2dtdy(tcur,ycur);
    tnext = tcur + alpha*df2dt2(tcur,ycur);
    
    %Caps your t/y next to... are we ever doing descent?
    if(tnext > tlim(2))
        tnext = tlim(2);
    elseif(tnext < tlim(1))
        tnext = tlim(1);
    end
    if(ynext > ylim(2))
        ynext = ylim(2);
    elseif(ynext < ylim(1))
        ynext = ylim(1);
    end
    %Check error
    if(abs(ynext-ycur) < tol_grad && abs(tnext-tcur) < tol_grad)
        break
    end
    ycur = ynext;
    tcur = tnext;
end 
ymax = ycur;
tmax = tcur;

%Step Size:
h=sqrt((2*trunc)/abs(dfdt(tmax,ymax)));

yvec(1)= ystart;
tvec(1)= tstart;

for(i=2:n)
    ynext = yvec(i-1)+f(tvec(i-1),yvec(i-1))*h;
    tnext = tvec(i-1)+h; 
    yvec(i) = ynext;
    tvec(i) = tnext;
end
end
