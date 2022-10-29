function [result] = simpsons(f,a,b,N)
%numerical integration using Simpson's rule
%inputs:
%   f: function
%   a: left interval point
%   b: right interval point
%   N: number of subintervals
    h = (b-a)/N;
    res = f(a)+f(b);
    
    for i=1:2:N-1
        res = res + 4*f(a+i*h);
    end
    
     for i=2:2:N-2
        res = res + 2*f(a+i*h);
    end
    
    result = h/3*res;
    
  
end

