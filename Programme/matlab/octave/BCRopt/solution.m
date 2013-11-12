function v= solution(delta,r,f) %solving A^r*v=f
   rpow=2^r;
   v=sol(delta,rpow,1,f); %solving tridiagonal systems
   for i=2:1:rpow
     v=v+sol(delta,rpow,i,f); %solving tridiagonal systems
   end
end

function f=sol(delta,rpow,i,f) %solving (A-mu I)x=f/mu   %%possible for unequal steps in x- and y-direction!!
   mu=2*cos((2*i-1)*pi/(2*rpow));
   j=[1:1:i-1 i+1:1:rpow];
   f=f/prod((mu-2.*cos((2.*j-1).*pi./(2*rpow)) ));% now f is the correct right-hand-side
   n=size(f);
   a=delta; %elements underneath the diag of A
   b=mu-2*(delta+1); %this is diag(A); all elements are the same;
   c=delta.*ones(n); %temporary vector (elements over the diag of A 
   c(1)=c(1)/b;
   f(1)=f(1)/b;%starting to overwrite f first time to a temporary vector
   for i=2:n(1)-1; %is there any way to avoid this loop?
     s=(b-c(i-1)*a); %this is faster (at least in octave)
     c(i)=c(i)/s;
     f(i)=(f(i)-f(i-1)*a)/s;
   end
   for i=n(1)-1:-1:1  %is there a way to avoid this loop?
     f(i)=f(i)-c(i)*f(i+1); %second overwriting of f to the solution-vector
   end
end
