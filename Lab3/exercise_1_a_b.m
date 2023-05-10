%%
%EXERCISE1 a
clc;clear;
f = @(x) 1 / (1 + x^2);
interval_length = 10;
E = zeros(12,2); 
for i = 1:12
    step = interval_length/(2*i);
    X = -5:step:5;
    pn = lagrange(f, X);
    t = zeros(100,1);
    idx = 1;
    for j = -5:0.01:5
        t(idx) = pn(j) - f(j);
        idx=idx+1;
    end
    E(i,1) = i*2;
    E(i,2) = norm(t, inf);
end

figure();
plot(E(:,1), E(:,2));
%set(gcf,'renderer','painters');
title("Interpolation error");
xlabel("Number of interpolation points");
ylabel("Infinity norm of f-pn");

%%
%EXERCISE1 b
f = @(x) 1./ (1 + x^2);
%chebychevgrid=@(leftbnd,rightbnd,n)leftbnd+((rightbnd-leftbnd)/2)*(cos(linspace(pi,0,n))+1);

E = zeros(12,2);
for i = 1:12
    n = 2*i+1;
    %X = chebychevgrid(-5,5,n);
    X = ch_node(-5,5,n);
    pn = lagrange(f, X);
    t = zeros(100,1);
    idx = 1;
    for j = -5:0.01:5
        t(idx) = pn(j) - f(j);
        idx=idx+1;
    end
    E(i,1) = i*2;
    E(i,2) = norm(t, inf);
end

figure();
plot(E(:,1), E(:,2));
title("Interpolation error using Chebyshev nodes")
xlabel("Number of interpolation points");
ylabel("Infinity norm of f-pn");