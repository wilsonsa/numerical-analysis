% Setup
tol = 5e-5;
order_1 = 0;
order_2 = 0;
order_3 = 0;
order_4 = 0;

error_1 = zeros(1,20);
error_2 = zeros(1,20);
error_3 = zeros(1,20);
error_4 = zeros(1,20);

xi_1 = 0;
xi_2 = 2;

% Insert your code here to calculate the values above.
% The taylor_exp_x function works the same way as the previous problem.
% To use taylor_exp_x, write: g = taylor_exp_x(n, xi);
% Inputs: n - order, xi - center point
% Outputs: g - anonymous function containing the Taylor Series
%order1
func = taylor_exp_x(order_1,xi_1);
error_1(1) = abs(exp(1) - func(1));
while(1)
    order_1 = order_1 + 1;
    func = taylor_exp_x(order_1,xi_1);
    error_1(order_1+1) = exp(1) - func(1);
    if(error_1(order_1+1) < tol);break;end
end
%order2
func = taylor_exp_x(order_2,xi_1);
error_2(1) = abs(exp(3) - func(3));

while(1)
    order_2 = order_2 + 1;
    func = taylor_exp_x(order_2,xi_1);
    error_2(order_2+1) = abs(exp(3) - func(3));
    if(error_2(order_2+1) >= tol);break;end
end
%order3
func = taylor_exp_x(order_3,xi_2);
error_3(1) = abs(exp(1) - func(1));

while(1)
    order_3 = order_3 + 1;
    func = taylor_exp_x(order_3,xi_2);
    error_3(order_3+1) = abs(exp(1) - func(1));
    if(error_3(order_3+1) >= tol);break;end
end
% order4
func = taylor_exp_x(order_4,xi_2);
error_4(1) = abs(exp(3) - func(3));
while(1)
    order_4 = order_4 + 1;
    func = taylor_exp_x(order_4,xi_2);
    error_4(order_4+1) = abs(exp(3) - func(3));
    if(error_4(order_4+1) >= tol);break;end
end