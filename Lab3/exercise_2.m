%%
%EXERCISE2
f = @(t,x) sin(5*pi.*x)*cos(10*pi.*t) + 2*sin(7*pi.*x).*cos(14*pi.*t);
step = 1/50;
T = 0:step:1;
X = transpose(0:step:1);

%% LIENAR INTERPOLATION
Y = f(T,X);
all_x = [];
all_y = [];

for i=1:51
    curr_y = Y(:,i);
    [A,B] = linear_int_spline(X,curr_y);
    x_for_one_function = [];
    y_for_one_function = [];
    
    for j=1:50
        xvalues = linspace(X(j),X(j+1),10);
        m = A(j);
        b = B(j);
        y = m*xvalues + b;
        x_for_one_function = [x_for_one_function, xvalues];
        y_for_one_function = [y_for_one_function, y];
        
    end
    all_x(i,:) = x_for_one_function;
    all_y(i,:) = y_for_one_function;
end

figure;
for i=1:50
    title(sprintf('Linear Spline Interpolation \n t=%0.2f', i), 'Interpreter', 'Latex');
    xlabel("x");
    ylabel("y");
    axis([0 1 -5 5]);
    axis manual
    drawnow;
    pause(0.05);
    h = plot(all_x(i,:), all_y(i,:)); 
end

%% NATURAL CUBIC SPLINE INTERPOLATION
clear;
f = @(t,x) sin(5*pi.*x)*cos(10*pi.*t) + 2*sin(7*pi.*x).*cos(14*pi.*t);
step = 1/50;
T = 0:step:1;
x = transpose(0:step:1);
Y = f(T,x);
n=length(x);
figure;
%set(groot,'DefaultFigureRenderer','painters');
for o=1:51
    y = Y(:,o);
    title(sprintf('Natural Cubic Spline Interpolation \n t=%0.2f', o-1), 'Interpreter', 'Latex');
    xlabel("x");
    ylabel("y");
    axis([0 1 -5 5]);
    drawnow;
    hold off;
    %find A(x), B(x), C(x) and D(x)    
    for j=1:n-1
        A(j,1:4)=[0 0 -1 x(j+1)]/(x(j+1)-x(j));
        B(j,1:4)=[0 0 1 -x(j)]/(x(j+1)-x(j));
        D1=[1];
        C1=[1];
        for i=1:3
            C1=conv(C1,[A(j,3) A(j,4)]);
            D1=conv(D1,[B(j,3) B(j,4)]);
        end
        C(j,1:4)=(C1-A(j,1:4))*((x(j+1)-x(j))^2)/6;
        D(j,1:4)=(D1-B(j,1:4))*((x(j+1)-x(j))^2)/6;
        
        % y_i'' y''_i+1
        AA=zeros(n,n);
        BB=(zeros(size(x)))';
        for i=2:(n-1)
            if i-1~=1
                AA(i,i-1)=(x(i)-x(i-1));
            end
            AA(i,i)=2*(x(i+1)-x(i-1));
            if i+1 ~=n
                AA(i,i+1)=(x(i+1)-x(i));
            end
            BB(i)= 6*(((y(i+1)-y(i))/(x(i+1)-x(i)))-((y(i)-y(i-1))/(x(i)-x(i-1))));
        end
        % solve linear equation system
        ypp=zeros(size(x));
        ypp(2:n-1)=AA(2:n-1,2:n-1)\BB(2:n-1)';
    end
 
    for j=1:n-1
        S(j,:) = A(j,:)*y(j) + B(j,:)*y(j+1)+ C(j,:)*ypp(j) + D(j,:)*ypp(j+1); %coefficients
    end
   
    for i = 2:50
     ss = linspace(x(i-1),x(i));
     plot(ss,(S(i,1).*ss.^3 + S(i,2).*ss.^2 + S(i,3).*ss + S(i,4))); hold on;
    end
end

%% HERMITE CUBIC SPLINE INTERPOALTION
% sorry this takes forever to run:( 


df = @(t,x) pi.*(14.*cos(14.*pi.*t).*cos(7.*pi.*x)+5.*cos(10.*pi.*t).*cos(5*pi.*x));
f = @(t,x) sin(5*pi.*x)*cos(10*pi.*t) + 2*sin(7*pi.*x).*cos(14*pi.*t);

step = 1/50;
T = 0:step:1;
X = transpose(0:step:1);
Y = f(T,X);
DY = df(T,X);

Ld0 = -1/step;
Ld1 = 1/step;

syms x;
l0 = @(xi) -(x-xi)/step;
l1 = @(xi) (x-xi)/step;

figure;
for j=1:51
    y = Y(:,j);
    dy = DY(:,j);
    title(sprintf("Hermite Cubic Spline Interpolation \n Please be patient it's really slow \n t=%0.2f", j-1), 'Interpreter', 'Latex');
    xlabel("x");
    ylabel("y");
    axis([0 1 -5 5]);
    drawnow;
    hold off;
    for i=2:length(X)
        L0 = l0(X(i));
        L1 = l1(X(i-1));
        H0 = L0^2*(1-2*Ld0*(x-X(i-1)));
        H1 = L1^2*(1-2*Ld1*(x-X(i)));
        K0 = L0^2*(x-X(i-1));
        K1 = L1^2*(x-X(i));
        s = H0.*y(i-1)+dy(i-1).*K0 + y(i).*H1+ dy(i).*K1;
        fplot(s,[X(i-1),X(i)]); hold on;
    end   
end

