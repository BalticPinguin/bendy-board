x=y=2;
k=h=0.02;
mis=0.02;

[f, n, m]=fillvect(x,y,h,k,4);
u=gausseid(f, n, m, mis); %f in Gauß-Seidel-Alg. schicken
U=reshape(u,n,m); % f ist gesuchte Funktion!!!
printu(U,x,y,k,h); % plotten
