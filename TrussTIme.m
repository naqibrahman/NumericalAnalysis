function [T] = TrussTIme(k)
LOAD = 10*[1:(2*k+1)];

f = @() Tussk(k,LOAD,0);
g = @() TussInv(k,LOAD,0);
h = @() TussLRU(k,LOAD,0);
fs = @() Tussk(k,LOAD,1);
gs = @() TussInv(k,LOAD,1);
hs = @() TussLRU(k,LOAD,1);


T(1)= timeit(f);
T(2) = timeit(g);
T(3)= timeit(h);
T(4)= timeit(fs);
T(5) = timeit(gs);
T(6)= timeit(hs);



end

