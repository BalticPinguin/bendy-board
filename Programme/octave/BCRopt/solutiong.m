%this function is slower than solution! a test with cputime gave about 20% difference in time!
function v= solutiong(delta,r,f); %solving A^r*v=f 
   v=sol(delta,r,1,f); %solving tridiagonal systems
   for i=2:1:2^r
     v=v+sol(delta,r,i,f); %solving tridiagonal systems
   end
end

function s=sol(delta,r,i,f); %solving (A-mu I)x=f/mu   %%possible for unequal steps in x- and y-direction!!
   mu=2*cos((2*i-1)*pi/2^(r+1));
   j=[1:1:i-1 i+1:1:2^r];
   f=f/prod((mu-2*cos((2*j-1)*pi/2^(r+1)))); %this is right-hand-side of equation
   n=size(f)(1);
   A=sparse(-2*(1+delta)+mu).*speye(n) + delta.*diag(ones(n-1,1),1) + delta.*diag(ones(n-1,1),-1); %this is A-mu I
   s=A\f;
end

