function y = forsub (A,b)
%
% y = forsub (A,b,p)
% Given a unit lower triangular, nonsingular n by n matrix A,
% an n-vector b, 
% return vector y which solves Ay = b

n = length(b);
% forward substitution
y(1,1) = b(1)/A(1,1);
for k = 2:n
    y(k,1) = (b(k) - A(k,1:k-1) * y(1:k-1))/A(k,k);
    
end
