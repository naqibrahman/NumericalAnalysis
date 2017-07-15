function nonlinear_bvp_newton(N,alpha,maxit,tol)
% use Newton's method, with steplengths of one, to try to solve the
% nonlinear boundary value problem discussed on p. 256-257 of A&G:
% the differential equation is
%      v''(t) + exp(v(t) = 0  for t in [0,1]
% using a discretization of N points in this interval
% and applying Newton's method with an initial guess 
%      v(t)=alpha t (t-1)
% where alpha is an input parameter.
%
t = linspace(0,1,N);  % top of p.257
v = alpha*t.*(1-t);  %  initial guess given at bottom of p.256
v = v'; % make it a column vector
clf
plot(t,v); % plot initial v
xlabel('t')
ylabel('v')
title(sprintf('solution of nonlinear boundary value problem, \\alpha = %d',alpha))
% check formula for derivative numerically
% delta = .001;
% [f1,J] = get_fun_and_its_jacobian(v,N);
% f2 = get_fun_and_its_jacobian(v + delta,N);
% fdif = (f2-f1);
% Jd = delta*J*ones(N,1); % directional derivative along 1,1,...,1
% [fdif Jd]
%
fnorm = inf;
iter = 0;
while iter < maxit && fnorm > tol
    iter = iter + 1;
    shg
    hold on
    % get the function f and Jacobian matrix J given on p.256
    [f,J] = get_fun_and_its_jacobian(v,N); 
    fnorm = norm(f);
    fprintf('At iteration %d, f has norm %g\n',iter,fnorm)
    fprintf('hit any key to continue\n')
    pause
    %
    % in this particular example, -J is symmetric but not diagonally dominant, 
    % and not necessarily positive definite either, so use \, not chol
    v = v - J\f; % next iterate via Newton step
    plot(t,v); % plot new iterate
end

end % function nonlinear_bvp_newton

function [f,J] = get_fun_and_its_jacobian(v,N)
% get the function f and its Jacobian matrix defined on p.256
h = 1/N;
hsq = h^2;
f = zeros(N,1); % vector
J = sparse(N,N); % tridiagonal, may as well make it sparse
for i=1:N
    % -2, not +2 as in Chap 4, because there is no minus sign in front of the second derivative
    f(i) = -2*v(i)/hsq + exp(v(i)); 
    J(i,i) = -2/hsq + exp(v(i)); % derivative of the ith equation f(i) w.r.t. ith variable v(i)
end
for i=1:N
    if i>1
        f(i) = f(i) + v(i-1)/hsq;
        J(i,i-1) = 1/hsq; % derivative of the ith equation f(i) w.r.t. (i-1)th variable v(i)
    end
    if i<N
        f(i) = f(i) + v(i+1)/hsq;
        J(i,i+1) = 1/hsq; % derivative of the ith equation f(i) w.r.t. (i+1)th variable vi(i)
    end
end
end % function get_jacobian

