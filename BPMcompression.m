%compression w the block power method to find singular values

%reading image A is 3 dimmensional array
A=imread('WallOfWindows.jpg','jpg');

%test image for quicker debbugging
%A=imread('testimage2.jpg','jpg');

%2d array for each pixel
A_red=double(A(:,:,1));
A_blue=double(A(:,:,2));
A_green=double(A(:,:,3));

%question 5 tells us that the eigen values of B are the square of the
%%signular values of A; thus we will use the block power method on B = A*A'
%and then do the square root of the eigen value


%block power method

r=30;
[V,E]=blockpowerHW8(A_red,r);
% V is the right singular vector  

[U,E]=blockpowerHW8(A_red',r);
%U is the left singular vector (we tranpsoed A_red' to change our B= A*A')
%here we are getting our singular values for S

S = U'*A_red*V;

% compressed red
A_r = U*S*V';
%%%%%%%% Above Repeated for blue 
[V,E]=blockpowerHW8(A_blue,r);
[U,E]=blockpowerHW8(A_blue',r);
S = U'*A_blue*V;
A_b = U*S*V';

%%%%%%%% Above Repeated for green 
[V,E]=blockpowerHW8(A_green,r);
[U,E]=blockpowerHW8(A_green',r);
S= U'*A_green*V;
A_g = U*S*V';


CompressedA = uint8(cat(3, A_r, A_b, A_g));
image(uint8(CompressedA));
title(strcat('(Block power method)r = ',num2str(r)));


