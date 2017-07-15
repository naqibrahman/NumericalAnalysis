
% alpha .85
[A,G,E]= googleMatrix(M,.85);
[X,L]= eig(G);
L = diag(L);
plot(real(L),imag(L),'rx');
axis equal;
hold on;
%alpha .5
[A,G,E]= googleMatrix(M,.5);
[X,L]= eig(G);
L = diag(L);
plot(real(L),imag(L),'bo');
hold on;
axis equal;
%alpha .25
[A,G,E]= googleMatrix(M,.25);
[X,L]= eig(G);
L = diag(L);
plot(real(L),imag(L),'g+');
axis equal;
hold on;
legend ( '.85','.5','.25');

% circle plots

th = 0:pi/500:2*pi; % points to plot
x = cos(th); % x value
y = sin(th); % y value
z= [x;y];
plot( .85*z(1,:),.85*z(2,:),'r');
hold on
plot( .5*z(1,:),.5*z(2,:),'b');
hold on
plot( .25*z(1,:),.25*z(2,:),'g');
hold on




