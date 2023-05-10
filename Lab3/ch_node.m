function [X] = ch_node(a,b,n)
X = [];
for k = 1:n
    X(k) = 0.5*(a+b)+0.5*(b-a)*cos(pi*(2*k-1)/(2*n));
end
end
