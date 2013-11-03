function []=gauss(x,y,k,h)
[f, n, m]=fillvectVec(x,y,h,k,4); %creating weight-function
u=inver(-(x/(2^(k+1)-1))^2*f,n, m, x, y); %f in Gauß-Seidel-Alg. schicken
U=reshape(u,n,m);
f=reshape(f,n,m); % f ist gesuchte Funktion!!!
%printu(U,x,y,k,h,f); % plotten

