t = t(:); b = b(:); %make sure they are column vectors
m = length(t);

deg = 25;

r = 1:20;
r = r/10;
for i =1:20
    [x1,x2,x3,x4,condN, A,] = approxpoly(t,b,deg+1,r(i)) ;
    normR(i) = norm(x4);
end 
plot(r,normR)
xlabel('cutoff r')

