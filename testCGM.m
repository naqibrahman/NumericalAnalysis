
%part a
B = randn(10);
A= B'*B;
b= randn(10,1);
x= zeros(10,1);

[x,del]=ConjGradM(A,b,x,1e-14);
x =x(:,end);
%part b
N = 100;
G = numgrid('S',N+2); 
A = delsq(G); 
b = ones(10000,1);
x= zeros(10000,1);

[x1,del]=ConjGradM(A,b,x,1e-8);
x1 = x1(:,end);
x2 = A\b;
semilogy(sqrt(del))
figure

f = @()ConjGradM(A,b,x,1e-8);
g = @()chol(A);
h = @() A\x;
time(1) = timeit(f);
time(2) = timeit(g);
time(3) = timeit(h);
figure

x1=reshape(x1,N,N);
x2= reshape(x2,N,N);
mesh(x1);
title('CGM')
figure
mesh(x2);
title('Backslash')






