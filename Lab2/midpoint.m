function [result] = midpoint(f,a,b,N)
%numerical integration using midpoint rule
%inputs:
%   f: function
%   a: left interval point
%   b: right interval point
%   N: number of subintervals

    h = (b-a)/N;
    result = 0;
    for i=0:N-1
        x_i = (i+0.5)*h;
        result = result + f(x_i)*h;
    end
end

