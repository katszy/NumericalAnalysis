function L = lagrange(f, X)
N = length(X);
L = @(x) 0;
for i = 1:N
    l = @(x) 1;
    for j = 1:N
        if(i ~= j)
           l = @(x) l(x) * (x - X(j)) / (X(i) - X(j)); 
        end
    end
    L = @(x) L(x) + l(x)*f(X(i));
end

end

