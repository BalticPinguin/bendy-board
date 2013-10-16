function []=platte(x,y,k,h);
x=y=2; %edge of area D in x and y-direction
k=h=4; %the steps and dimensions are x/(2^(k+1)-1) and y/(2^(h+1)-1) .

f=fillvect(x,y,h,k,4); %function makes weight-function f
mkoctfile bcr.cc
U=bcr(k,-(x/(2^(k+1)-1))^2*f); %solves the equation ; second element: weight-function, multiplied with Delta^2 x 
%printu(U,x,y,k,h,f); % plotten
