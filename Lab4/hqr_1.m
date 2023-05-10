function [Q,R]=hqr_1(A)
[~,n]=size(A);
R=A; %Start with R=A
Q=eye(n); 
for k=1:n-1
    x=zeros(n,1);
    x(k:n,1)=R(k:n,k); %choose column vector of A
    v=x; 
    v(k)=x(k)+ norm(x);
    s=norm(v);
    if s~=0
        w=v/s; 
        u=2*R'*w;
        R=R-w*u'; %Product HR
        Q=Q-2*Q*w*w'; %Product QR
    end
end