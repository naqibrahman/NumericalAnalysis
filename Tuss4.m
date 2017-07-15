function [ A,b,x] = TussLRU(k,LOAD,s)
%Gives a and B for any k tuss using lru
%size of array is m
 m = 5+8*k;
 %creates b
 b = zeros(m,1);
 %load is in every 4
 for i = 1:size(LOAD,2)
     b(4*i)= LOAD(i);
 end
 % w is alpha
  w = sin(pi/4);
% creates A
 A=zeros(m);
 %first four will always be the same
 A(1,1)=w; A(1,4)=-1; A(1,5)=-w;
 A(2,1)=w; A(2,3)=1; A(2,5)=w;
 A(3,2)=1; A(3,6)=-1;
 A(4,3)=1; 
 %last 5 will always be the same
 A(m,m)=1;  A(m,m-1)= w;
 A(m-1,m-2)=1;
 A(m-2,m)=-1; A(m-2,m-3)=1;
 A(m-3,m-1)=w; A(m-3,m-2)=1; A(m-3,m-4)=w;
 A(m-4,m-1)=-w; A(m-4,m-4)=w; A(m-4,m-5)=1;
 % there will be 2k-1 middle joints therefore
 for i = 1:(2*k-1)
     %patternwhen its odd
     if mod(i,2) == 1
         %row 1
         A(1+(4*i),(4*i))=1; A(1+(4*i),4+(4*i))=-1;
         %row 2
         A(2+(4*i),3+(4*i))=1;
         %row3
         A(3+(4*i),1+(4*i))=w; A(3+(4*i),2+(4*i))=1;
         A(3+(4*i),5+(4*i))=-w; A(3+(4*i),6+(4*i))=-1;
         %row4
         A(4+(4*i),1+(4*i))=w; A(4+(4*i),3+(4*i))=1;A(4+(4*i),5+(4*i))=w;
     end
     %reverse pattern when even
     if mod(i,2)==0
         %row1
         A(1+(4*i),1+(4*i))=w; A(1+(4*i),2+(4*i))=1;
         A(1+(4*i),5+(4*i))=-w; A(1+(4*i),6+(4*i))=-1;
         %row2
         A(2+(4*i),1+(4*i))=w; A(2+(4*i),3+(4*i))=1;A(2+(4*i),5+(4*i))=w;
         %row3
         A(3+(4*i),(4*i))=1; A(3+(4*i),4+(4*i))=-1;
         %row4
         A(4+(4*i),3+(4*i))=1;


     end
  
 end
     
if( s==1)
A = sparse(A);
end


[L,U]= lu(A);

y=L\b;
x= U\y;

    


 

end

