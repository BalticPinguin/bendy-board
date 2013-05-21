function u = gausseid (f, n, m, mis) 
g=f;
u=g.*0.25; 
 % Fehlerabsch"atzung!!!
for k=0:mis
   u(1)=(g(1)+u(2)+u(n+1))*0.25;
   for i=2:n-1
      u(i)=(g(i)+u(i-1)+u(i+1)+u(i+n))*0.25;
   end
   u(n)=(g(n)+u(n-1)+u(2*n))*0.25;
   for j=n:n:(m-2)*n
      u(j+1)=(g(j+1)+u(j+2)+u(j+n+1)+u(j-n+1))*0.25;
      for i=2:n-1
         u(j+i)=(g(j+i)+u(j+i+1)+u(j+i+n)+u(j+i-n)+u(j+i-1))*0.25;
       end
       u(j+n)=(g(j+n)+u(j)+u(j+n-1)+u(j+2*n))*0.25;
   end
   u((m-1)*n)=(g((m-1)*n)+u((m-1)*n+1)+u((m-1)*(n-1)))*0.25;
   for i=1:n-2
      u((m-1)*n+i)=(g((m-1)*n+i)+u((m-1)*n+i-1)+u(n*(m-1)-1+i)+u(n*(m-1)+1+i))*0.25;
   end
   u(m*n)=(g(m*n)+u(n*m-1)+u(m*n-1))*0.25;
end
