n=20;
m=20;
I=-eye(n,n);
T=4.*eye(n,n);
T(1,2)=-1;
for i=2:n-1
   T(i,i-1)=-1;
   T(i,i+1)=-1;
end
T(n,n-1)=-1;
O=zeros(n,n);
A=[T I O O O O O O O O; I T I O O O O O O O; O I T I O O O O O O ; O O I T I O O O O O ; O O O I T I O O O O ; O O O O I T I O O O ;O O O O O I T I O O ;O O O O O O I T I O ;O O O O O O O I T I ; O O O O O O O O I T ];
F=[A zeros(10*n,10*n); zeros(10*n, 10*n) A];
B=tril(F);
C=eye(n*m,n*m)-inv(B)*F; %Fehlerfortplflanzungsmatrix
max(eig(C)) %0.94899
min(eig(C)) %0
norm(C) %0.95162


G=4*eye(n*m,n*m);
H=eye(n*m,n*m)-inv(G)*F; %Fehlerfortplflanzungsmatrix
norm(H) %0.97416
