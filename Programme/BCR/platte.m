function []=platte(x,y,k,h);

f=fillvect(x,y,h,k,4); %function makes weight-function f
U=bcr(k,-(x/(2^(k+1)-1))^2*f); %solves the equation ; second element: weight-function, multiplied with Delta^2 x 
%printu(U,x,y,k,h,f); % plotten
