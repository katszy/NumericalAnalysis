function [x, steps, stoppingCriterion] = simpleIteration(f,x0,eps,L)
%SIMPLEITERATION executes simple iteration on function f and calculates the theoretical stopping criterion
%INPUT:
%   f: function
%   x0: starting point
%   eps: precision
%   L: contraction constant
%OUTPUT:
%   x: root of f
%   steps: number of iterations 
%   stoppingCriterion: theoretical stopping criterion 

    x1= f(x0);

    stoppingCriterion = ((log(abs(x0-x1))-log(eps*(1-L)))/log(1/L))+1;
    stoppingCriterion = round(stoppingCriterion);
   
    x0 = x1;
    
    
    diff=1000000;
    steps = 1;
    
    while diff>eps
        x1 = f(x0);
        diff = abs(x1-x0);
        x0=x1;
        steps = steps+1;
    end
    
    x = x0;
    steps;

end



