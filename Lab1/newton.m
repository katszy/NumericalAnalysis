function [x,it] = newton(f, df, x0, precision)
%NEWTON finds the root of a function using Newton's method
%INPUTS:    
%   f: function 
%   df: derivative of f
%   x0: initial guess
%   eps: precision
%OUTPUTS: 
%   x2: root
%   it: numbe of iterations 
%REMARKS:
% this method can fail if 
%   - the initial guess is not close enough to the root --> max. steps
%   is 100
%   - the tangent line is nearly horizontal (f'(x) is close to 0)
   
    it = 0;
    x = x0;
    while abs(f(x))>precision
        x = x - f(x)/df(x);
        if isinf(x)
            error("Oops, tangent line is nearly horizontal.")
        end
        
        if it > 100
            error("Oops, solution isn't converging.")
        end
        it = it + 1;
    end
end

