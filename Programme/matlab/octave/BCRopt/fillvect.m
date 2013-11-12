function [f] = fillvect(x,y,k,h,num)
p=2^(k+1)-3; %this is 1 element smaller than needed; because of creation of i,j
q=2^(h+1)-3;
k=x/q;
h=y/p;
i=linspace(h,x-h,q);
j=linspace(k,x-k,p);

switch num
case 1
   I=ones(size(j)); % Vector consisting of 1
   J=ones(1,size(i)(2));
   u=I*(i-1).^2;
   o=((j-1).^2)'*J;
   tmp1=((x-1)^2-o+u).^0.5;
case 2
   tmp1=exp(-(((j'-0.5)*29).^2*ones(size(j))+ones(size(i'))*((i-0.5)*29).^2));
   tmp1=tmp1+exp(-(((j'-1.5)*29).^2*ones(size(j))+ones(size(i'))*((i-1.5)*29).^2));
   tmp1=tmp1+exp(-(((j'-0.5)*29).^2*ones(size(j))+ones(size(i'))*((i-0.5)*29).^2));
   tmp1=tmp1+exp(-(((j'-1.5)*29).^2*ones(size(j))+ones(size(i'))*((i-1.5)*29).^2));
%case 3
case 4
   tmp1=exp(-(((j'-1.0)*8).^2*ones(size(j))+ones(size(i'))*((i-1.5)*8).^2));
end

n=size(tmp1);
tmp2=[zeros(n(1),1) tmp1 zeros(n(1),1)]; %F mit "0" umranden
f=[zeros(1,n(2)+2); tmp2; zeros(1,n(2)+2)];
