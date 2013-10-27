function v= solution(delta,r,f); %solving A^r*v=f
   v=sol(delta,r,1,f); %solving tridiagonal systems
   for i=2:1:2^r
     v=v.+sol(delta,r,i,f); %solving tridiagonal systems
   end
end

function f=sol(delta,r,i,f); %solving (A-mu I)x=f/mu   %%possible for unequal steps in x- and y-direction!!
   mu=2*cos((2*i-1)*pi/2^(r+1));
   j=[1:1:i-1 i+1:1:2^r];
   f=f/prod((mu.-2.*cos((2.*j.-1).*pi./2^(r+1))));
   n=size(f)(1);
   a=delta; %elements underneath the diag of A
   b=mu-2*(delta+1); %this is diag(A); all elements are the same;
   c=delta.*ones(size(f)); %temporary vector (elements over the diag of A 
   c(1)=c(1)/b;
   f(1)=f(1)/b;%starting to overwrite f first time to a temporary vector
   for i=2:n-1; %is there a way to avoid this loop?
     c(i)=c(i)/(b-c(i-1)*a); 
     f(i)=(f(i)-f(i-1)*a)/(b-c(i-1)*a);
   end
   for i=n-1:-1:1  %is there a way to avoid this loop?
     f(i)=f(i)-c(i)*f(i+1); %second overwriting of f to the solution-vector
   end
end
