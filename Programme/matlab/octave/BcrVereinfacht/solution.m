function v= solution(k,h,x,y,r,f) %solving A^r*v=f
   v=Ar(r,k,h,x,y)\f;
end

function A=Ar(r,k,h,x,y) % calculates A^(r)
   A=fillA(k,h,x,y);
   I=speye(2^(h+1)-1);
   for i=1:1:r %iteration
      A=2*I-A^2;
   end
end

function A=fillA(k,h,x,y) %creates A^(0)as a sparse-matrix
  q=2^(h+1)-1;
  p=2^(k+1)-1;
  lambda=x*q/(p*y);
  A=sparse(-2*(1+lambda).*speye(q)+diag(ones(q-1,1),1)+diag(ones(q-1,1),-1));
end
