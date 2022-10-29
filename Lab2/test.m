%% Exercise 1
%a
fprintf( '__________________________________ \n Exercise 1 \n');
integrand = @(x) sin(x);
left = 0;
right = pi/2;
N = 15;

res1 = midpoint(integrand,left,right,N);
fprintf("[Itegration using the Midpoint rule with N=%d]: %.4f \n", N, res1);
res2 = trapezoidal(integrand,left,right,N);
fprintf("[Itegration using the Trapezoidal rule with N=%d]: %.4f \n", N, res2);
res3 = simpsons(integrand,left,right,N);
fprintf("[Itegration using the Simpsons rule with N=%d]: %.4f \n", N, res3);
res4 = simpsons(integrand,left,right,N*2);
fprintf("[Itegration using the Simpsons rule with 2N points, N=%d]: %.4f \n", N*2, res4);
%%
%b
N=15;
[error_rate, errors, h] = convergenceRate(@midpoint,integrand,left,right,N);
[error_rate2, errors2, h2]= convergenceRate(@trapezoidal,integrand,left,right,N);
[error_rate3, errors3, h3] = convergenceRate(@simpsons,integrand,left,right,N);

figure()
subplot (3,1,1);
plot(log2(h), error_rate);
  title ("midpoint rule");

 subplot (3,1,2);
  plot(log2(h2), error_rate2);
  title ("trapezoidal rule");
  
 subplot (3,1,3);
  plot(log2(h), error_rate3);
  title ("Simpson's rule");
 sgtitle('convergece of different methods');
 hold on

figure()
plot(log2(h),log2(errors),log2(h2),log2(errors2),log2(h3),log2(errors3));
xlabel('log(h)')
ylabel('log(error)')
title('loglog plot of errors')
legend('midpoint','trapezoidal','Simpson')
p1 = polyfit(log2(h),log2(errors),1) ;
p2 = polyfit(log2(h2),log2(errors2),1) ;
p3 = polyfit(log2(h3),log2(errors3),1) ;
slope1=p1(1);
slope2=p2(1);
slope3=p3(1);
fprintf("slope Midpoint: %f \n", slope1);
fprintf("slope Trapezoidal: %f \n", slope2);
fprintf("slope Simpsons: %f \n", slope3);
  
%%
%c
hold on
figure()
[error_rate4, errors4, h4] = convergenceRate(@trapezoidal_mistake,integrand,left,right,N);
subplot (2,1,1);
  loglog (h2, error_rate2);
  title ("trapezoidal rule");
 subplot (2,1,2);
  loglog (h4, error_rate4);
  title ("wrong trapezoidal rule");
 sgtitle('convergece of correct and incorrect trapezoidal rule')
 %it converges to 1 instead of 2 
 %% Exercise 2
%a

fprintf( '__________________________________ \n Exercise 2 \n');

f=@(y,t) y-y.^3;
T = 10;
y0= 0.1;
N = 30;
[u, v] = EulerFunc(f,T,y0,N);
[z, s] = backwardEuler(f,T,y0,N);
[l, k] = CN(f,T,y0,N);

figure();
plot(u,v, z,s, l,k);
legend('Euler', 'Backward Euler', 'Crank-Nicolson')
xlabel('t');
ylabel('y');
title("solution approximations of y'=y+y^3")
 
 %% b
 y_0= 0.1;
 f = @(x) y_0 / sqrt(y_0.^2 - ( (y_0.^2 - 1) * exp((-2)*x)));
 N=15;
 t = linspace(0,1,N+1);
 y = arrayfun(f,t);
 figure();
 plot(t,y);
 xlabel('t');
 ylabel('y');
 title("solution of y'=y+y^3"); 
 



