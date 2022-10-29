function  [t,y]=CN(f,T,y0,N)
% performs Crank-Nicolson method to approximate the solution of a differential equation 
% Input: f: handle of anonymous function
%        y0: initial condition y(a)
%        T: time
%        N: number of steps

    h = T/N;
    y=[y0 zeros(1,N)];
    y(1) = y0;
    t = (0:h:T);
    for i=1:N
        y(i+1) = y(i) + 0.5 * h *f(y(i)) + 0.5 * h * f(y(i) + h * f(y(i)));
    end
end

