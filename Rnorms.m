function [ rn, kA, kB ] = Rnorms( t,b,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:100

    [x1,x2,x3,x4,condN, A] = approxpoly(t,b,i,r) ;
    
    
    kA(i)= condN;
    kB(i)= condN.^2;
    rn(1,i)= norm(x1-x4,2)/norm(x4,2);
    rn(2,i)= norm(x2-x4,2)/norm(x4,2);
    rn(3,i)= norm(x3-x4,2)/norm(x4,2);
    
end


figure
loglog(rn(1,:))
hold on
loglog(rn(2,:))
hold on 
loglog(rn(3,:))
hold on 

legend('method one','method two', 'method three')
title();
%figure
%semilogy(kA);
%hold on;
%semilogy(kB);
%legend('k(A)', 'k(B)')


end

