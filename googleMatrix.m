function [ A, G, E ] = googleMatrix( M, alpha )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = sum(M);
n= size(M,1);
A= zeros(n,n);
for j=1:n
    if N(j)>0
        for i= 1:n
            if(M(i,j)==1)
                A(i,j)= (1/N(j));
            end
        end
    else
        for i= 1:n
            A(i,j)=1/n;
        end
    end           
end

G = alpha*A +(1-alpha)*(1/n)*ones(n,n);

E= eig(G);

end

