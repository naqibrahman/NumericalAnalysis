t = t(:); b = b(:); %make sure they are column vectors
m = length(t);

deg = 25;

[x1,x2,x3,x4,condN, A] = approxpoly(t,b,deg+1) ;

tt = linspace(t(1),t(m), 1000); % points for plotting
pt =0;
for i=1: deg+1
pt =pt+  x4(i).*tt.^(i-1); % computes the approximating polynomial values
end

pt2 =0;
for i=1: deg+1
pt2 =pt2+  x2(i).*tt.^(i-1); % computes the approximating polynomial values
end

plot(tt,pt);
hold on;
plot(tt,pt2);
hold on;
legend('method 4', 'method 2');

