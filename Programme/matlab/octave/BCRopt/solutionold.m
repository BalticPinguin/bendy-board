function v= solutionold(r,f); %solving A^r*v=f
   v=sol(r,1,f); %solving tridiagonal systems
   for i=2:1:2^r
     v=v+sol(r,i,f); %solving tridiagonal systems
   end
end

function s=sol(r,i,f); %solving (A-mu I)x=f/mu     %%change for unequal steps in x- and y-direction!!
   mu=2*cos((2*i-1)*pi/2^(r+1));
   j=[1:1:i-1 i+1:1:2^r];
   f=f/prod((mu-2*cos((2*j-1)*pi/2^(r+1))));
   mu=mu-4;
   tmp1=1/(mu);
   tmp2=f(1)/(mu);
   c=d=[];
   n=size(f)(1);
   for i=2:1:n-1 %size of c
      c=[ c; tmp1 ];
      d=[ d; tmp2 ];
      tmp2=(f(i)-tmp2)/(mu-tmp1);
      tmp1=1/(mu-tmp1);
   end
   c=[ c; tmp1 ];
   d=[ d; tmp2 ];
   tmp2=(f(n)-tmp2)/(mu-tmp1); % this is wrong!! f(n) is needed!!!
   d=[ d; tmp2 ];
   s=d(n);
   for j=n-1:-1:1
   s=[d(j)-c(j)*s(1); s]; %here is an error occuring!
end
