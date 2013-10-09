function [f, o, u] = fillvect(x,y,k,h,num);

i=h:h:x-h; %Rand soll nicht beachtet werden!
j=k:k:y-k;

switch num
case 1
    n=size(j);
    I=ones(n(2),1); % Einsvector
    n=size(i);
    J=ones(1,n(2)); 
    u=I*(i.-1).^2;
    o=((j.-1).^2)'*J;
   f=o-u;
   tmp1=abs((0.25- f).^(0.5));
case 2
   tmp1=j'*i;
case 3
   tmp1=i'*j; % da i,j Zeilenvektoren sind!!!
case 4
   tmp1=e.^-(((j'-1.0)*8).^2*ones(size(j))+ones(size(i'))*((i-1.5)*8).^2);
endswitch

figure; bar=mesh(j,i,tmp1);
title('Gewichtsfunktion');
print -dpng 'gewfunk.png';

n=size(tmp1);
tmp2=[zeros(n(1),1) tmp1 zeros(n(1),1)]; %F mit "0" umranden
F=[zeros(1,n(2)+2); tmp2; zeros(1,n(2)+2)];
f=reshape(F,(n(1)+2)*(n(2)+2),1); % f ist gesuchte Funktion!!!
o=n(1)+2;
u=n(2)+2;
