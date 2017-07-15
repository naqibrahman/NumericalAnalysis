
% Alpha is .85
[A,G,E]= googleMatrix(M,.85);
[X,L]= eig(G);
% matching eig value one column to its coresponding eigen vector
k= find(E,1);
x = X(:,1);
%normalizing to one norm
x = x/sum(x);
[xsort,index] = sort(x, 'descend');
url(index(1:10))

%Alpha is .5
[A,G,E]= googleMatrix(M,.5);
[X,L]= eig(G);
% matching eig value one column to its coresponding eigen vector
k= find(E,1);
x = X(:,1);
%normalizing to one norm
x = x/sum(x);
[xsort,index] = sort(x, 'descend');
url(index(1:10))

%Alpha is .5
[A,G,E]= googleMatrix(M,.25);
[X,L]= eig(G);
% matching eig value one column to its coresponding eigen vector
k= find(E,1);
x = X(:,1);
%normalizing to one norm
x = x/sum(x);
[xsort,index] = sort(x, 'descend');
url(index(1:10))
