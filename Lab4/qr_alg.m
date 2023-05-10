clc; clear;
%exercise 1a

%building the matrix 
v2 = [2 2 2 2 2 2 2 2 2 2];
v1 = [-1, -1, -1, -1, -1, -1, -1, -1, -1];
D0 = diag(v2);
D1 = diag(v1,1);
D2 = diag(v1,-1);
D = D1+D2+D0;
D = D*11^2;

A = D;
[n, ~]=size(A);
eigenvalues = zeros(n,1);

% qr shift algorithm
for j=1:n-1
    while (abs(A(n,n-1))>0.001)
        [Q,R] = hqr_1(A-A(n,n)*eye(n));
        A = R*Q+A(n,n)*eye(n);
    end
    eigenvalues(j) = A(n,n);
    A = A(1:n-1,1:n-1);
    [n, ~]=size(A);
end

eigenvalues(end) = A(1,1);

%exact eigenvalues
k = 1:10;
e = 4*11^2*sin(k*pi/22).^2;

fprintf("comparing the exact and calculated eigenvalues"); %very nice results 
e = sort(e)';
eigenvalues = sort(eigenvalues);
diff = abs(e-eigenvalues)'

plot(1:10, eigenvalues, 'bx', 1:10, e, 'ro');
xlabel("#eigenvalues");
ylabel("value");
title("exact and calculated eigenvalues");
legend("eigenvalues calculated by HQR","exact eigenvalues", 'Location', 'southeast');


%%
%exercise 1b 
A = D;
[m,n] = size(A);
steps = 100;
eps = 0.001;

%inverse iteration
w=zeros(n,1)+eigenvalues(1);
for k = 1:steps
    v = w/norm(w,2);
    w = thomas_algo(A,v);
    theta =v'*w;
    if norm(w-theta.*v,2) < eps*abs(theta)
        break;
    end
end
x = w/theta; %smallest eigenvector 


%exact eigenvector
ex = sin(pi*(1:10)/11);
ex = ex/norm(ex);

fprintf("exact eigenvector"); ex'
fprintf("smallest eigenvector"); x

fprintf("comparing the exact and calculated eigenvector") %yass very nice again 
diff_vec = abs(ex-x')