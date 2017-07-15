[v,resid1,lambda(1)]=powermethod(M,.85);
[v,resid2,lambda(2)]=powermethod(M,.5);
[v,resid3,lambda(3)]=powermethod(M,.25);

semilogy(1:length(resid1),resid1);
hold on;
semilogy(1:length(resid2),resid2);
hold on;
semilogy(1:length(resid3),resid3);
hold on;
ConvRate(1)= resid1(length(resid1))/resid1(length(resid1)-1);
ConvRate(2)= resid2(length(resid2))/resid2(length(resid2)-1);
ConvRate(3)= resid3(length(resid3))/resid3(length(resid3)-1);
display(ConvRate);
legend('.85','.5','.25');
