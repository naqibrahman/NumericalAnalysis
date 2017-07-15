function [ v,T ] = blockpowerHW8( A,r )
%param r is rank wanted, % v is either U or V in svd dependinging on
%whether or not we use A or A tranpose (look at line 18 and HW5 problem 5)
% diaganol of T are our eigen values which we can square root for the
% singualr values

n= size(A,2);
c= 1;

% initial guess (MUST HAVE INDEPENDENT COLUMNS)
v=5*rand(n,r); 



while(1) % we are only using itteration in this loop and not convergence
    %this is because we are approximatiting 
           
    
    v= A'*(A*v);
    [v,R] = qr(v,0); % orthogonalize the columns of V: essential to make this work
    % our itter by 2
    T= v'*(A'*(A*v));
    
    c= c+1;
    if (c>25) %itter 
        %v= v/(norm(v,2));
        break
    end
    
        
end
end

