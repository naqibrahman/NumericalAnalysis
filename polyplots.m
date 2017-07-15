function [rn] = polyplots(t,b,deg, nPlot)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
t = t(:); b = b(:); %make sure they are column vectors
m = length(t);


[x1,x2,x3,x4,condN, A] = approxpoly(t,b,deg+1) ;

tt = linspace(t(1),t(m), nPlot); % points for plotting
pt =0;
for i=1: deg+1
pt =pt+  x4(i).*tt.^(i-1); % computes the approximating polynomial values
end
plot(tt,pt)
hold on
plot(t',b','ro','LineWidth',2)
xlabel('t')
ylabel('v')
figure;

for i = 1:100

    [x1,x2,x3,x4,condN, A] = approxpoly(t,b,i) ;
    
    r= b-A*x4;
    rn(i)= norm(r,2)
    plot (r);
    hold on;
    end
legend SHOW
figure ;
plot (log(rn);
   

end


