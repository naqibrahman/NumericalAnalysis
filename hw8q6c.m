N = 100;
r=50;
G = numgrid('S',N+2); 
K = delsq(G); 
B = sprand(N^2,r,1);
b = ones(N^2,1);
x= zeros(N^2,1);



% (k\B = invK*B ) %(B'/K = B'*invK) 

% f = @(v)( v + ((K\B)*    ((B'/K)*v) )  );
% [x,del]=NewConjGradM(f,b,x,1e-8);
% semilogy(sqrt(del))
% figure
% x=x(:,end);
% x=reshape(x,N,N);
% mesh(x);


D = sprand(speye(N^2));
g = @(v)(D*v + ((K\B)*    ((B'/K)*v) )  );

[y,del2]= preCondCGM(g,b,x,D,1e-8);
figure
semilogy(sqrt(del2))
figure
y=y(:,end);
y= reshape(y,N,N);
mesh(y)

