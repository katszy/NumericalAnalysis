function [result] = trapezoidal_mistake(f,a,b,N)
%numerical integration using wrong trapezoidal rule, neglecting the half-valued weights at the endpoints
%inputs:
%   f: function
%   a: left interval point
%   b: right interval point
%   N: number of subintervals
    h = (b-a)/N;
    result = 0;
    for i=0:N
        x_i = i*h;
        result = result + f(x_i)*h;
    end    
end

