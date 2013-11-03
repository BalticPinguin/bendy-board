function q=buneman(k,h,x,y,q) %q, u are matrixes
  %first calculating all q^r (by overwriting weightfunction)
  for j=2:2:2^(k+1)-2
    q(:,j)=q(:,j-1)+q(:,j+1)-2*solving(k,h,x,y,0,q(:,j)); %first element with all even inizes
  end
  for r=1:1:k-1
     f=2^(k+1)-2^(r+1);
     for j=2^(r+1):2^(r+1):f
        q(:,j)=solving(k,h,x,y,r,q(:,j-3*2^(r-1))+q(:,j+3*2^(r-1))+q(:,j-2^(r-1))+q(:,j+2^(r-1))-q(:,j-2^r)-q(:,j+2^r)-2*q(:,j))+q(:,j-2^r)+q(:,j+2^r)-q(:,j-2^(r-1))-q(:,j+2^(r-1))+q(:,j); %recursion
     end
  end
  %% NOW CALCULATING u!! BUT WRITING IN q because I can
  q(:,2^k)=0.5*(q(:,2^(k-1))+q(:,3*2^(k-1))-q(:,2^k))+solving(k,h,x,y,k,q(:,2^k)); %calculating first (middle) element of u
  for r=k-1:-1:1
    q(:,2^r)=0.5*(q(:,2^(r-1))+q(:,3*2^(r-1))-q(:,2^r))+solving(k,h,x,y,r,q(:,2^r)-q(:,2^(r+1))); %the last element is u_2^r+1
    f=2^(k+1)-2^r;
    for j=3*2^r:2^(r+1):f-2^(r+1)
       q(:,j)=0.5*(q(:,j-2^(r-1))+q(:,j+2^(r-1))-q(:,j))+solving(k,h,x,y,r,q(:,j)-q(:,j-2^r)-q(:,j+2^r)); %the last two elements are u_j +- 2^r
    end
    q(:,f)=0.5*(q(:,f-2^(r-1))+q(:,f+2^(r-1))-q(:,f))+solving(k,h,x,y,r,q(:,f)-q(:,f-2^r)); %the last element is u_2^r+1
  end
  %at last all uneven elements (r==0)
  q(:,1)=solving(k,h,x,y,0,q(:,1)-q(:,2)); %the last element is u_2^r+1
  f=2^(k+1)-1;
  for j=3:2:f-2
     q(:,j)=solving(k,h,x,y,0,q(:,j)-q(:,j-1)-q(:,j+1)); %the last two elements are u_j +- 2^r
  end
  q(:,f)=solving(k,h,x,y,0,q(:,f)-q(:,f-1)); %the last element is u_2^r+1
end
