N = 100;
%G is an N+2 by N+2 full matrix with border entries set to zero
G = numgrid('S',N+2); % ?S? means square with columnwise ordering
% A is the n by n five-point Laplacian sparse matrix, where n=N^2
A = delsq(G); % "del-squared" is a common term for the Laplacian
spy(A,'bx');
L = chol(A, 'lower');
hold on
spy(L, 'ro');

nonzeros = [nnz(A),nnz(L)];

nz=[];
dNorm = [];
%test tols
tol = [1e-6,1e-5,1e-4,1e-3,1e-2,1e-1,1];
for drop = tol
    opts.type = 'ict';
    opts.droptol = drop; %drop whats tol
    L = ichol(A, opts);
    nz = [nz,nnz(L)]; %adds to list of nonzeros
    dNorm = [dNorm, norm(L*L'-A,1)];
end

 %plots
figure
loglog (tol, nz,'-x');
hold on
loglog(tol, dNorm, '-o');



