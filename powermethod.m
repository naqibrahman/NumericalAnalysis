function [v,resid,lambda] = powermethod(M,alpha)
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

f= ones(n,1);
% iteration of the power method: see A&G p.222
c= 1;
v=ones(n,1)*(1/n);

while(1) % should replace this by a while loop that checks both
           % the max number of iterations and the norm of the 
           % residual r = A*v - lambda*v
           
    u = v;
    v= (alpha*(A*v) + ((1-alpha)*(1/n)*(f'*v)*f)); % matriv-vector product
    v= v/norm(v,2);
    resid(c) = norm(v-u,1); % again, should not compute A*v again!

 
    if (resid(c)<1e-12) 
        break
    end
    c= c+1;
        
end
lambda= v'*v;

        
end