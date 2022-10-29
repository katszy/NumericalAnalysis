%%
%Exercise 1&2
fprintf('Exercise 2 \n');

% function
f = @(x) x.^3 + 2*x.^2 + 10 * x - 20;
%derivative of f
df = @(x) 3*x.^2 + 4*x + 10;

% starting points
x0 = 1;
x1 = 2;

% Newton's method
[n_x, it] = newton(f ,df ,x0,1e-4);
fprintf("[Newton's method]: x=%e, steps: %d \n",n_x,it)

% Secant method
[s_x, it] = secant(f ,x0 ,x1,1e-4);
fprintf("[Secant's method]: x=%e, steps: %d \n",s_x,it)

% Bisection method
[b_x, it] = bisection(f ,x0,x1,1e-4);
fprintf("[Bisection method]: x=%e, steps: %d \n",b_x,it)

%%
%Exercise 3
fprintf( '__________________________________ \n Exercise 3 \n');

%function
t = @(x) tanh(x);
%derivative of t
dt = @(x) 1-tanh(x)^2;
%starting point
x0=-5;

try
    [n_x, it] = newton(t , dt, x0,1e-4);
    fprintf("[Newton's method]: x=%e, steps: %d \n",n_x,it)
catch
    disp("Newton's method failed. Choose a different starting point.")
end


x0=-5;
x1=-4;
try
    [s_x, it] = secant(t , x0, x1, 1e-4);
    fprintf("[Secant method]: x=%e, steps: %d \n",s_x,it)
catch
    disp("Secant method failed on this section. Choose different starting points.")
end

x0= 5;
x1= 10;
try
    [b_x, it] = bisection(f ,x0,x1,1e-4);
    fprintf("[Bisections method]: x=%e, steps: %d",b_x,it)
   
catch
    disp('Bisection method failed, f(a) and f(b) have the same sign. Choose a differet starting interval.')
end

%%
%Exercise 4 
fprintf('__________________________________ \n Exercise 4 \n');

g = @(x) 20/(x^2+2*x+10);
x0 = 1; %initial guess
eps = 1e-4;
L = 0.47; %calculated on paper 

[x, it, it2] = simpleIteration(g,x0,eps,L);
fprintf("[Fixed Point Iteration]: x=%.4e, steps: %d, steps using the theoretical stopping condition: %d \n", x, it, it2);
fprintf("The theoretical stopping condition is rather pessimistic")