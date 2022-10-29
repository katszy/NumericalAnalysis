function [x,it] = bisection(f,a,b,eps)
%BISECTION finds the root of a function using the Bisection method
%INPUTS: 
    %f: function
    %a: starting point of interval
    %b: end point of interval 
    %eps: precision
%OUTPUTS: 
%   x: root 
%   it: number of iterations 
%REMARKS:
% this method can fail if 
%   - f(a) and f(b) have the same sign -> the root is not in the [a,b] interval


    it = 0;
    c = (a+b)/2; %define midpoint
    while abs(f(c))>eps
        if f(a) * f(b) > 0
            error("Oops, root is not in this interval.")
        end
        if f(c)==0
            break
        else
            if f(c)*f(b)>0
                b = c; %define new interval point
            else
                a = c; %define new interval point
            end
        end      
        it = it + 1;
        c = (a+b)/2;
    end

    x = c;

end

