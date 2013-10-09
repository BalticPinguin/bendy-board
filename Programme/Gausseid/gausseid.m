function u = gausseid (f, n, m, mis ) 
f=f/(n*m);
u=f.*0.15*n*m; 
   % Fehlerabsch"atzung!!!
err=1-(h*pi)^2; %Gesch"atzter Anfangsfehler bei u^0=0
while err >mis
   err=err*(1-(h*pi)^2);
   u(1)=(f(1)+u(2)+u(n+1))*0.25;
   for i=2:n-1
      u(i)=(f(i)+u(i-1)+u(i+1)+u(i+n))*0.25;
   end
   u(n)=(f(n)+u(n-1)+u(2*n))*0.25;
   for j=n:n:(m-2)*n
      u(j+1)=(f(j+1)+u(j+2)+u(j+n+1)+u(j-n+1))*0.25;
      for i=2:n-1
         u(j+i)=(f(j+i)+u(j+i+1)+u(j+i+n)+u(j+i-n)+u(j+i-1))*0.25;
       end
       u(j+n)=(f(j+n)+u(j)+u(j+n-1)+u(j+2*n))*0.25;
   end
   u((m-1)*n)=(f((m-1)*n)+u((m-1)*n+1)+u((m-1)*(n-1)))*0.25;
   for i=1:n-2
      u((m-1)*n+i)=(f((m-1)*n+i)+u((m-1)*n+i-1)+u(n*(m-1)-1+i)+u(n*(m-1)+1+i))*0.25;
   end
   u(m*n)=(f(m*n)+u(n*m-1)+u(m*n-1))*0.25;
end
