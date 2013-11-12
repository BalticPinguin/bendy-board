function u=bcr(k,h,x,y,f) %q, u are matrixes
   A=fillA(k,h,x,y); %see below
   for r=1:1:k
      for i=2^r:2^r:2^(k+1)-2
        f(:,i)=f(:,i-1)+f(:,i+1)-A*f(:,i);
      end
      A=2*speye(size(f))-A^2; %iterating A
   end %now all even indizes are iterated.
   u=zeros(size(f)); %initializing matrix of solution
   u(:,2^k)=A\f(:,2^k); %this is the firsts element solution
   for r=k-1:-1:1 %iterating backwards for solving for u
      rpot=2^r;
      u(:,rpot)=solution(r, f(:,rpot)-u(:,2*rpot)); %first element in the matrix
      for j=rpot:2*rpot:2^(k+1)-2*rpot
         u(:,j)=solution(r, f(:,j)-u(:,j*2)-u(:,2*j-rpot));
      end
      last=2^(k+1)-rpot; %temporary value
      u(:,last)=solution(r, f(:,last)-u(:,last-rpot));
   end %end of iteration for u
end

function A=fillA(k,h,x,y) %taken from Bcvereinfacht
  q=2^(h+1)-1;
  p=2^(k+1)-1;
  lambda=x*q/(p*y);
  A=sparse(-2*(1+lambda).*speye(q)+diag(ones(q-1,1),1)+diag(ones(q-1,1),-1));
end
