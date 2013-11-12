function []=platte(x,y,k,h)
%edge of area D in x and y-direction
%k=h=6 is too large
[f, n, m]=fillvect(x,y,h,k,4); %creating weight-function
u=inver(-(x/(2^(k+1)-1))^2*f,n, m, x, y); %f in Gauß-Seidel-Alg. schicken
U=reshape(u,n,m);
f=reshape(f,n,m); % f ist gesuchte Funktion!!!
%printu(U,x,y,k,h,f); % plotten

