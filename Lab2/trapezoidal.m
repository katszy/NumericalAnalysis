function [result] = trapezoidal(f,a,b,N)
%numerical integration using trapezoidal rule
%inputs:
%   f: function
%   a: left interval point
%   b: right interval point
%   N: number of subintervals
    h = (b-a)/N;
    result = 0;
    for i=0:N
        x_i = i*h;
        if i == 0 | i==N 
             result = result + f(x_i)*h/2;
        else
            result = result + f(x_i)*h;
        end
    end
       
end

