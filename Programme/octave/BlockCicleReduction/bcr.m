function u= bcr(A,k,f); %f, u are matrixex
   if k==1
      u=ution(A,f); %f=f_i (one of the vectors of size m)
   else
      newf=[]; %make sure, temp is empty and exists
      for i=2:2:2^k
         x=f(:,i-1)+f(:,i+1)-A*f(:,i); 
         newf=[newf x];
      end
      tmp1=bcr(2*eye(size(A)(1))-A^2,k-1,newf);
      for j=1:2:2^k-1
         un=f(:,1)-tmp1(1);
         for i=3:2:2^k-1 %what happens for k=2? Here may not be a part
            un=[un f(:,i)-tmp1(:,(i+1)/2)-tmp1(:,(i-1)/2)];
         end
         un=[un f(:,2^k+1)-tmp1(:,2^(k-1))];
         for i=1:1:size(un)(1) %this loop seems avoidable
            tmp2=[tmp2 ution(A,un(:,i))];
         end
         u=tmp2(1)
         for i=1:2:2^(k-1)
            u=[u tmp(i) tmp2(i+1)];
            %does u=[u tmp(i) ution(A,un(:,i/2))]; work????
         end
      end
   end
   u;
   A;
end

function a=ution(A,f); %this can be made better, if possible and neccesary
   a=inv(A)*f;
end
