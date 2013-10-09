function [f] = fillvect(x,y,k,h,num);
p=2^(k+1)-2; %this is 1 element smaller than needed; because of creation of i,j
q=2^(h+1)-2;
k=x/q;
h=y/p;
i=h:h:y-h;%I don't want weight on the edge
j=k:k:x-k;% now i,j have length p and q 

switch num
case 1
   n=size(j);
   I=ones(n(2),1); % Vector consisting of 1
   n=size(i);
   J=ones(1,n(2)); 
   u=I*(i.-1).^2;
   o=((j.-1).^2)'*J;
   f=-o+u;
   tmp1=abs((0.25+ f).^(0.5));
case 2
   tmp1=j'*i;
case 3
   tmp1=i'*j; % i,j are line vectors!!! 
case 4
   tmp1=e.^-(((j'-1.0)*8).^2*ones(size(j))+ones(size(i'))*((i-1.5)*8).^2);
endswitch

n=size(tmp1);
tmp2=[zeros(n(1),1) tmp1 zeros(n(1),1)]; %F mit "0" umranden
f=[zeros(1,n(2)+2); tmp2; zeros(1,n(2)+2)];
%f=reshape(F,(n(1)+2)*(n(2)+2),1); % f ist gesuchte Funktion!!!
