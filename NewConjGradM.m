function [ x,delta ] = NewConjGradM(Avmult,b, x ,tol)
x = x(:); b = b(:); %make sure they are column vectors
%counter
k =1;
%residual from guess
r(:,k) = b-Avmult(x(:,k));
%inner product of residual
delta(k) = r(:,k)'*r(:,k);
bdelt= b'*b;
%so we dont need to compute twice
tolerance = tol^2 *bdelt;
p(:,1) = r(:,1);
while(delta(k)>tolerance)
    s(:,k) = Avmult(p(:,k));
    alpha(k) = delta(k)/(p(:,k)'*s(:,k));
    x(:,k+1) = x(:,k) + alpha(k)*p(:,k);
    r(:,k+1)= r(:,k)-alpha(k)*s(:,k);
    delta(k+1)=r(:,k+1)'*r(:,k+1);
    p(:,k+1)= r(:,k+1) + (delta(k+1)/delta(k))*p(:,k);
    
    k=k+1;
   
end

