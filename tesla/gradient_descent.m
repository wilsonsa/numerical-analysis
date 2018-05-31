function [guess] = gradient_descent(dCost,guess,step_size,tol)

change  = 100;

while(change > tol)
    gradient = dCost(guess(1),guess(2));
    guess_new = guess - step_size*gradient;
    change = abs(norm((guess_new - guess)/guess));
    guess = guess_new;
end
end

