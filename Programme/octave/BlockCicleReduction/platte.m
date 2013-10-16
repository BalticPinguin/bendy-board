x=y=2;
k=h=2;

f=fillvect(x,y,h,k,4);
f;
A=fillA(k,h,x,y);
U=bcr(A,k+1,f);
%U=reshape(u,2^(k+1)-1,2^(h+1)-1); % f ist gesuchte Funktion!!!
printu(U,x,y,k,h); % plotten
