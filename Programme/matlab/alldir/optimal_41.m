function []=optimal(x,y,k,h)
p=2^(h+1)-1; %initialize dimensions and constants
q=2^(k+1)-1;
delta=x*p/(y*q);
%m=linspace(0,x,q);
%l=linspace(0,y,p);
%graphics_toolkit fltk; %makes octave use its own graphical environment; with gnuplot some errors occur...
%figure(1); %initialize the figure
%clf %make the figure clean; maybe not required, but better
%subplot(3,2,1); % this will be first plot with some information abaout constants and so on
%set(gca, 'visible', 'off');
%text (0, 1, {'Berechnung mit dem Buneman-Algorithmus.'});
%text (0, 0.75, {'Gitterabstand x-Richtung: ' x/q});
%text (0, 0.5, {'Gitterabstand y-Richtung: ' y/p});
%text (0, 0.25, {'Plattengroesse: (0:' x')x(0:' y')'});

F=fillvectMat(x,y,h,k,4); %function makes weight-function f
%subplot(3,2,5);
%   [cv,ch]=contourf(m,l,F,18);
%   set(ch,'edgecolor','none');
%   title('Gewichtsfunktion, Aufsicht');
%   colorbar('North'); 
%   xlabel ('x'); 
%   ylabel ('y'); 
%subplot(3,2,3);
%   view([-4,4,4]);
%   surf(m,l,F);
%   %colorbar("West"); 
%   title('Gewichtsfunktion, perspektivisch');
%   xlabel ('x'); 
%   ylabel ('y'); 

F=-(x/q)^2.*F; %looking for better solution!?

for j=2:2:q-1
  F(:,j)=F(:,j-1)+F(:,j+1)-2.*solution(delta,0,F(:,j)); %first element with all even inizes
end
for r=1:1:k-1
   f=q+1-2^(r+1);
   for j=2^(r+1):2^(r+1):f
      F(:,j)=solution(delta,r,F(:,j-3*2^(r-1))+F(:,j+3*2^(r-1))+F(:,j-2^(r-1))+F(:,j+2^(r-1))-F(:,j-2^r)-F(:,j+2^r)-2*F(:,j))+F(:,j-2^r)+F(:,j+2^r)-F(:,j-2^(r-1))-F(:,j+2^(r-1))+F(:,j); %recursion
   end
end
%% NOW CALCULATING u!! BUT WRITING IN q because I can
F(:,2^k)=0.5*(F(:,2^(k-1))+F(:,3*2^(k-1))-F(:,2^k))+solution(delta,k,F(:,2^k)); %calculating first (middle) element of u
for r=k-1:-1:1
  F(:,2^r)=0.5*(F(:,2^(r-1))+F(:,3*2^(r-1))-F(:,2^r))+solution(delta,r,F(:,2^r)-F(:,2^(r+1))); %the last element is u_2^r+1
  f=q+1-2^r;
  for j=3*2^r:2^(r+1):f-2^(r+1)
     F(:,j)=0.5*(F(:,j-2^(r-1))+F(:,j+2^(r-1))-F(:,j))+solution(delta,r,F(:,j)-F(:,j-2^r)-F(:,j+2^r)); %the last two elements are u_j +- 2^r
  end
  F(:,f)=0.5*(F(:,f-2^(r-1))+F(:,f+2^(r-1))-F(:,f))+solution(delta,r,F(:,f)-F(:,f-2^r)); %the last element is u_2^r+1
end
%at last all uneven elements (r==0)
F(:,1)=solution(delta,0,F(:,1)-F(:,2)); %the last element is u_2^r+1
for j=3:2:q-2
   F(:,j)=solution(delta,0,F(:,j)-F(:,j-1)-F(:,j+1)); %the last two elements are u_j +- 2^r
end
F(:,q)=solution(delta,0,F(:,q)-F(:,q-1)); %the last element is u_2^r+1

%subplot(3,2,2); %second plot;
%   view([4,-4,4]);
%   meshc(m,l,F);
%   title('Plattenverformung, perspektivisch');
%   xlabel ('x'); 
%   ylabel ('y'); 
%subplot(3,2,4);
%   view([-4,4,4]);
%   surf(m,l,F);
%   %colorbar("West"); 
%   title('Platte, perspektivisch');
%   xlabel ('x'); 
%   ylabel ('y'); 
%subplot(3,2,6);
%   [cv, ch]=contourf(m,l,F,18);
  % set(ch,'edgecolor','none');
 %  title('Plattenverformung, Aufsicht');
%   colorbar('North'); 
%   xlabel ('x'); 
%   ylabel ('y'); 
%print(1,'losesung.png','-dpng256');
