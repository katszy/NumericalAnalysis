function [error_rate, errors, h_vec] = convergenceRate(method, f, left,right, N)
% inputs: 
%   method: integration method (midpoint/trapezoidal/simpsons)
%   f: function
%   a: left interval point
%   b: right interval point
%   N: number of subintervals

% vector for errors
errors = zeros(N,1);
% vector for error rate 
error_rate = zeros(N-1,1);
%vector for h values 
h = zeros(N-1,1);

for i = 1:N
    h(i)=(2^i);
    result = method(f, left, right, 2^i); %result of numerical integration 
    errors(i) = abs(1-result);  % the error is (1-result) since the integrand is 1 
end

% error rates
for i = 1:N-1
    error_rate(i) = log2( errors(i) / errors(i+1) );
end

h_vec = h(1:N-1);
errors = errors(1:N-1);
end

