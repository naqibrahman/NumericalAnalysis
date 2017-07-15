%testing on functions f,g,h,i,j 
%bounds [1,2],[-10,10],[2,4],[8,10], [2*pi+1e-4, 3*pi+1e-4]
f = @(x)(x^3 -2);
fderiv = @(x)(3*x^2);

g = @(x)(exp(x)-2);
gderiv = @(x)(exp(x));

h = @(x)(2*cosh(x/4)-x);
hderiv = @(x)(  ( sinh(x/4)-2 )/2  );

i = @(x)(2*cosh(x/4)-x);
ideriv = @(x)(  ( sinh(x/4)-2 )/2  );

j = @(x)(sin(x));
jderiv = @(x)(cos(x));

[r(1),itter1,info1] = findroot(1,2,f, fderiv);
[r(2),itter2,info2] = findroot(-10,10,g, gderiv);
[r(3),itter3,info3] = findroot(2,4,h, hderiv);
[r(4),itter4,info4] = findroot(8,10,i, ideriv);
[r(5),itter5,info5] = findroot(2*pi+1e-4,3*pi+1e-4,j, jderiv);

% True R values x* computed by hand for 1,2,5 for 3/4 we use our last
% convergence
x= [2^(1/3),log(2),r(3),r(4),3*pi];
% second derivatives
fdd = @(x)(6*x);
gdd = @(x)(exp(x));
hdd = @(x)(cosh(x/4)/4);
idd = @(x)(cosh(x/4)/4);
jdd = @(x)(-1*sin(x));


M = [abs( fdd( x(1) ) )   /(2*abs( fderiv( x(1) ) )),... 
     abs( gdd( x(2) ) )   /(2*abs( gderiv( x(2) ) )),...
     abs( hdd( x(3) ) )   /(2*abs( hderiv( x(3) ) )),...
     abs( idd( x(4) ) )   /(2*abs( ideriv( x(4) ) )),...
     abs( jdd( x(5) ) )   /(2*abs( jderiv( x(5) ) )),...
    ]

%convergence ratios 
for i= 1:size(itter1,2)-1
    convF(i) =  abs(itter1(i+1)-x(1))/(abs(itter1(i)-x(1))^2);
end
disp(convF);
for i= 1:size(itter2,2)-1
    convG(i) =  abs(itter2(i+1)-x(2))/(abs(itter2(i)-x(2))^2);

end
disp(convG);
 for i= 1:size(itter3,2)-1
     convH(i) =  abs(itter3(i+1)-x(3))/(abs(itter3(i)-x(3))^2);
 
 end
 disp(convH);
 for i= 1:size(itter4,2)-1
     convI(i) =  abs(itter4(i+1)-x(4))/(abs(itter4(i)-x(4))^2);
 
 end
 disp(convI);
 for i= 1:size(itter5,2)-1
     convJ(i) =  abs(itter5(i+1)-x(5))/(abs(itter5(i)-x(5))^2);
 
 end
 disp(convJ);