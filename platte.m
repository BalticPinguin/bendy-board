x=y=2;
k=0.02;
h=0.02;
mis=1;

[f, n, m]=fillvect(x,y,h,k,4);
u=gausseid(f, n, m, mis); %f in Gauß-Seidel-Alg. schicken
% U=reshape(u,n,m); % f ist gesuchte Funktion!!!
% printu(U,x,y,k,h); % plotten
