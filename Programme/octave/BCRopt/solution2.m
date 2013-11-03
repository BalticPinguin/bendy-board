function v= solution2(r,f); %solving A^r*v=f
   v=+sol(r,1,f); %solving tridiagonal systems
   for i=2:1:2^r
     v=v+sol(r,i,f); %solving tridiagonal systems
   end
end

function s=sol(r,i,f); %solving (A-lambda I)x=f/lambda
   lambda=2*cos((2*i-1)*pi/2^(r+1));
   for j=1:1:i-1
     f=f/(lambda-2*cos((2*j-1)*pi/2^(r+1)));
   end
   for j=i+1:1:2^r
     f=f/(lambda-2*cos((2*j-1)*pi/2^(r+1)));
   end
   lambda=lambda-4;
   tmp1=1/(lambda);
   tmp2=f(1)/(lambda);
   c=d=[];
   n=size(f)(1);
   for i=2:1:n-1 %size of c
      c=[ c; tmp1 ];
      d=[ d; tmp2 ];
      tmp2=(f(i)-tmp2)/(lambda-tmp1);
      tmp1=1/(lambda-tmp1);
   end
   c=[ c; tmp1 ];
   d=[ d; tmp2 ];
   tmp2=(f(n)-tmp2)/(lambda-tmp1); % this is wrong!! f(n) is needed!!!
   d=[ d; tmp2 ];
   s=d(n);
   for i=n-1:-1:1
      s=[d(i)-c(i)*s(1); s];
   end
end
