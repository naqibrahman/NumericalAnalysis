%compression w the block power method to find singular values

%reading image A is 3 dimmensional array
%A=imread('WallOfWindows.jpg','jpg');

%test image for quicker debbugging
A=imread('testimage2.jpg','jpg');

%2d array for each pixel
A_red=double(A(:,:,1));
A_blue=double(A(:,:,2));
A_green=double(A(:,:,3));

%question 5 tells us that the eigen values of B are the square of the
%%signular values of A; thus we will use the block power method on B = A*A'
%and then do the square root of the eigen value


%block power method

r= 100;
[V,E]=blockpowerHW8(A_red,r);
% V is the left singular vector  

[U,E]=blockpowerHW8(A_red',r);
%U is the right singular vector (we tranpsoed A_red' to change our B= A*A')

S= U'*A_red*V';
A_r = U*S*V';

% [U1,S1,V1] = svd(A_red,0);
% 
% %  image(uint8(A_r));
% %  figure
% %  image(uint8(A_red));
% %   
% 
% % 
%%%%%%%% Above Repeated for blue 
[V,E]=blockpowerHW8(A_blue,r);
[U,E]=blockpowerHW8(A_blue',r);
S = zeros(r,r);
for i=1:r
    S(i,i)= sqrt(E(i,i));
end
%compresed blue
A_b = U*S*V';

%%%%%%%% Above Repeated for green 
[V,E]=blockpowerHW8(A_green,r);
[U,E]=blockpowerHW8(A_green',r);
S = zeros(r,r);
for i=1:r
    S(i,i)= sqrt(E(i,i));
end
%compresed blue
A_g = U*S*V';


CompressedA = uint8(cat(3, A_r, A_b, A_g));
image(uint8(CompressedA));
title(strcat('r = ',num2str(r)));
