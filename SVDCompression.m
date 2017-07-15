%reading image A is 3 dimmensional array
A=imread('WallOfWindows.jpg','jpg');

%2d array for each pixel
A_red=double(A(:,:,1));
A_blue=double(A(:,:,2));
A_green=double(A(:,:,3));

% Economy SVD for each pixel
[U_r,S_r,V_r]= svd(A_red,0);
[U_b,S_b,V_b]= svd(A_blue,0);
[U_g,S_g,V_g]= svd(A_green,0);


for r= [100,30,20,10]
A_r = U_r(:,1:r)*S_r(1:r,1:r)*V_r(:,1:r)';
A_b = U_b(:,1:r)*S_b(1:r,1:r)*V_b(:,1:r)';
A_g = U_g(:,1:r)*S_g(1:r,1:r)*V_g(:,1:r)';
figure;
CompressedA = uint8(cat(3, A_r, A_b, A_g));
image(CompressedA);

%block power method
%question 5 tells us that the eigen values of B are the square of the
%%signular values of A; thus we will use the block power method on B = A*A'
%and then do the square root of the eigen value


title(strcat('r = ',num2str(r)));
end

