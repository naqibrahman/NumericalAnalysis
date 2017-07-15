function [x1,x2,x3,x4,condN, A] = approxpoly(t,b,n,r) 
% Calculates LSR with 4  different methods
% degrees are n-1


t = t(:); b = b(:); %make sure they are column vectors
m = length(t);

A = ones(m,n); %W have an MxN matrix in mind
for j=1: n-1
A(:,j+1) = A(:,j).*t; %raises each to its corresponding power
end


%METHOD ONE
x1 = A \ b; % This solves the system Ax = b

%METHOD TWO
B = A'*A;
y = A'*b;
% this gives us G transpose
[G,p] = chol(B);
if p~= 0
    x2= NaN;
else
    z = forsub(G',y);
    x2 = backsub(G,z);
end
%METHOD THREE
[Q,R]= qr(A,0);
c = Q'*b;
x3= backsub(R,c);

%METHOD FOUR

[U,S,V]= svd(A,0);
z2= U'*b;
minInd=size(S,2);
for i=1:size(S,2)
    if S(i,i)>r
        y2(i,1)=z2(i)/S(i,i);
    
    else 
        minInd=i-1;
        break
    end 
        
end
size(y2)
size(V(:,minInd))

x4= V(:,1:minInd)*y2;
condN = S(1,1)/S(minInd,minInd);



end
