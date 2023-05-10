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

