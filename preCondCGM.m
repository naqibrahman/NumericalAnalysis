function [ x,delta ] = preCondCGM(Avmult,b, x ,P,tol)
x = x(:); b = b(:); %make sure they are column vectors
%counter
k =1;
% inverse of P
Pinv= inv(P);
%residual from guess
r(:,k) = b-Avmult(x(:,k));
%inner product of residual
h(:,k) = Pinv*r(:,k);
delta(k) = r(:,k)'*h(:,k);
bdelt= b'*Pinv*b;
%so we dont need to compute twice
tolerance = tol^2 *bdelt;
p(:,1) = h(:,1);
while(delta(k)>tolerance)
    s(:,k) = Avmult(p(:,k));
    alpha(k) = delta(k)/(p(:,k)'*s(:,k));
    x(:,k+1) = x(:,k) + alpha(k)*p(:,k);
    r(:,k+1)= r(:,k)-alpha(k)*s(:,k);
    h(:,k+1)= Pinv*r(:,k+1);
    delta(k+1)=r(:,k+1)'*h(:,k+1);
    p(:,k+1)= h(:,k+1) + (delta(k+1)/delta(k))*p(:,k);
    
    k=k+1;
    if(k>1000)
    break;
    end
    
   
end

