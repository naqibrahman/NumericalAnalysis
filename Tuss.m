function [ A,b,x ] = Tuss(LOAD)
%Gives a and B for tuss
 % load vector
 b= [0,0,0,LOAD(1),0,0,0,LOAD(2),0,0,0,LOAD(3),0]';
 % w is my alpha
 w = sin(pi/4);
 % Hardcoded in A
 A=  [0,0,0,0,0,0,0,0,-w,-1,0,0,w;
     0,0,0,0,0,0,0,0,w,0,1,0,w;
     0,0,0,0,0,0,0,-1,0,0,0,1,0;
     0,0,0,0,0,0,0,0,0,0,1,0,0,;
     0,0,0,0,0,-1,0,0,0,1,0,0,0,;
     0,0,0,0,0,0,1,0,0,0,0,0,0;
     0,0,0,-1,-w,0,0,1,w,0,0,0,0;
     0,0,0,0,w,0,1,0,w,0,0,0,0;
     0,-w,0,0,w,1,0,0,0,0,0,0,0,;
     0,w,1,0,w,0,0,0,0,0,0,0,0;
     -1,0,0,1,0,0,0,0,0,0,0,0,0;
     0,0,1,0,0,0,0,0,0,0,0,0,0;
     1,w,0,0,0,0,0,0,0,0,0,0,0;];
 % I realized my A was in descending form so fliped
 A= fliplr(A);
 %x is the solution
 x = A\b;
 % m is the size 
 m = size(A,1);
 % points to plot
 X1= [0,0,1,1,1,1,2,2,2,2,3,3,3];
 Y1 = [0,0,1,1,1,0,1,1,0,0,1,1,0];
 X2 = [1,1,1,2,2,2,2,3,3,3,3,4,4];
 Y2 = [1,0,0,1,0,0,0,1,1,0,0,0,0];
 for i = 1:m
     % this is for extension
     if(x(i)>0)
     plot([X1(i),X2(i)],[Y1(i),Y2(i)],'LineWidth',abs(x(i))/3,...
     'Color',[.6 0 0]);
     hold on;
     end
     %compression
     if(x(i)<0)
     plot([X1(i),X2(i)],[Y1(i),Y2(i)],'LineWidth',abs(x(i))/3,...
     'Color',[0 0 .6]);
     hold on;
     end
     % for when its clsoe to zero
     if(x(i)== 0)
     plot([X1(i),X2(i)],[Y1(i),Y2(i)],'LineStyle', ':','Color',[0 .6 0]);
     hold on;
     end
     

 end;
 % just so everything is square
 axis([0,4,0,4]);

 

end

