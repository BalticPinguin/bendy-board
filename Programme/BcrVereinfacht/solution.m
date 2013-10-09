function v= solution(r,f); %solving A^r*v=f
   x=y=2; %edge of area D in x and y-direction
   k=h=4; %the steps and dimensions are x/(2^(k+1)-1) and y/(2^(h+1)-1) .
   v=foo(r,k,h,x,y)\f;
end

function A=foo(r,k,h,x,y);
   A=fillA(k,h,x,y);
   I=eye(2^(h+1)-1);
   for i=1:1:r
      A=2*I-A^2;
   end
end

function A=fillA(k,h,x,y);
  q=2^(h+1)-1;
  p=2^(k+1)-1;
  lambda=x*q/(p*y);
  A=-2*(1+lambda)*eye(q)+diag(ones(q-1,1),1)+diag(ones(q-1,1),-1);
end


