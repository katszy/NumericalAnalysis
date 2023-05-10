function [a,b]=linear_int_spline(x,y)

k = length(x)-1;
for i = 1:k
    a(i) = (y(i)-y(i+1))/(x(i)-x(i+1));
    b(i) = (y(i+1)*x(i) - y(i)*x(i+1))/(x(i)-x(i+1));
end

