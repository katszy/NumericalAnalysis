function x = thomas_algo(A,d)
    n = length(d);
    x = zeros(n,1);
    
    % forward elimination
    for i = 2:n
        w = A(i,i-1)/A(i-1,i-1);
        A(i,i) = A(i,i)-w*A(i-1,i);
        d(i) = d(i)-w*d(i-1);
    end
    
    % backward substitution
    x(n) = d(n)/A(n,n);
    for i = (n-1):(-1):1
        x(i) = (d(i)-A(i,i+1)*x(i+1))/A(i,i);
    end
    
end