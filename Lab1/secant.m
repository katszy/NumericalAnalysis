function [x2,it] = secant(f,x0,x1,eps)
%this function finds the root of a function using the Secant method
%INPUTS:    
%   f:function
%   x0: start point of interval 
%   x1: end point of interval
%   eps: precision
%OUTPUTS: 
%   x2: root, 
%   it: number of iterations 
%REMARK:
% this method can fail if 
%   - the initial interval is not close enough to the root --> max. steps
%   is 100
%   - the secant is nearly horizontal    
    
    it = 0;
    x2 = x0;
    
    while abs(f(x2))>eps
        x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
        x0 = x1;
        x1 = x2;
        
        if isinf(x2)
            error("Oops, secant is nearly horizontal.")   
        end
        
        if it > 100
            error("Oops, solution isn't converging.")
        end
                
        it = it+1;
    end
end

