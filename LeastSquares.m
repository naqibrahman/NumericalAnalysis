function [A,x,p] = approxpoly(t,b,deg,nPlot) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if length(t)~= length(b)
    error( 'len t ~= len b');
end

m = length(t);
if(m<deg+1)
    error('not enough data');
end
A = zeros(length(t),deg+1); % This tells Matlab we have a M by M matrix in mind
powers = 0:deg; %we want our poly nomial to be of degree equal to deg

for j=1: deg+1
A(:,j) = t.^powers(j); %raises each to its corresponding power
end
x = A \ b; % This solves the system Ax = b
tt = linspace(t(1)-5,t(m)+5, nPlot); % points for plotting
pt =0;


for i=1: deg+1
pt =pt+  x(i).*tt.^(i-1); % computes the approximating polynomial values
end

plot(tt,pt)
hold on
plot(t',b','ro','LineWidth',2)
xlabel('t')
ylabel('v')


end
