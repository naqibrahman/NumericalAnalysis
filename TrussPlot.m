function [T,T2] = TrussPlot()
k = [1,10,50,100,200,500,750,1000];
LOAD = 10*[1:(2*1000+1)];

T= zeros(7,1);
T2 = zeros(7,1);
for i= 1:size(k,2)
f = @() Tussk(k(i),LOAD(1,1:(2*k-1)),0);
fs = @() Tussk(k(i),LOAD(1,1:(2*k-1)),1);
T(i)= timeit(f);
T2(i) = timeit(fs);
end

plot(k,T);
hold on;
plot(k,T2);



end
