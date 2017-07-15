function [ r, iterates, info ] = findroot( a, b, f, fderiv )
% finds root with a<b 
%and f(a)*f(b) <0

lB= f(a); % sets current "left bound" of the root
rB= f(b); %sets current "right bound" of the root

% returns NaN as there is no gurantee a root is in the range
if (lB*rB>0)
    r = NaN;
    iterates = NaN;
    info = NaN;
 return 
end


%check lB / aB
if (lB == 0)
    r = a;
    iterates = NaN;
    info = NaN;
 return 
end
if (rB == 0)
    r = b;
    iterates = NaN;
    info = NaN;
 return 
end
c= 1; % hybrid itterations 
xk = lB;%intial guess 
xk1 = rB;
while(1)
    
    inf = 0; % keeps track of what method was used to computer xk1
    xk1 = xk -f(xk)/fderiv(xk); %newton method
    %rejection for bisection if things dont work
    if(xk1<a || xk1>b)
        xk1 = (a+b)/2;
        inf = 1; %bisection was used
    end
    eval = f(xk1); %computes the new guess
    % changes a and b depending on update
    if (eval*rB>0) %% this lets you know which bound to update
        rB = eval; 
        b= xk1;
    else
        lB= eval;
        a= xk1;
    end
    %logs what step was used
    info(c) = inf;
    iterates(c) = xk1;
    if(abs(xk-xk1)/max(1,abs(xk))<1e-14)
        break
    end
    if(c>1000)%itter
        break
    end
    % updates and continues loop
    xk = xk1;
    c = c+1;

    
end
r= xk1;
end

