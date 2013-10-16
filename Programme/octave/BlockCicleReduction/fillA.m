function A=fillA(k,h,x,y);
  q=2^(h+1)-1;
  %p=2^(k+1)-1;
  %lambda=(x*q/(p*y);
  A=4*eye(q)-diag(ones(q-1,1),1)-diag(ones(q-1,1),-1);
end
