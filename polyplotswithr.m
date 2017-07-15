r = [0,.1,.5,1];
deg = 25;
m = length(t);
tt = linspace(t(1),t(m), 1000); % points for plotting
for i= 1:4
pt =0;
[x1,x2,x3,x4,condN, A,] = approxpoly(t,b,deg+1,r(i)) ;
figure
for j=1: deg+1
pt =pt+  x4(j).*tt.^(j-1); % computes the approximating polynomial values
end
plot(tt,pt)
hold on
plot(t',b','ro','LineWidth',2)
xlabel('t')
ylabel('v')

end