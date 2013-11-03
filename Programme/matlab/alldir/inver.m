function u=inver(f,n,m,x,y);
   I=eye(m);
  lambda=x*m/(n*y);
   T=-2*(1+lambda)*eye(m)+diag(ones(m-1,1),1)+diag(ones(m-1,1),-1);
   A=[I T];
   for i=3:1:n
      A=[A zeros(m)];
   end
   for j=2:1:n-1
      B=[]; %B becomes a new line in matrix
      for i=1:1:j-2
         B=[B zeros(m)];
      end
      B=[B I T I ];
      for k=j+2:1:n %is this working for the second last row???
         B=[B zeros(m)];
      end
      A=[A; B];
   end
   S=[zeros(m)];
   for i=2:1:n-2
      S=[zeros(m) S];
   end
   A=[A; S I T];
   u=inv(A)*f;
end
