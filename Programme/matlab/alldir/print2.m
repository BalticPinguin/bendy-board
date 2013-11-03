function i=print2(u,x,y,k,h,f)
   p=2^(h+1)-2; %initialize dimensions and constants
   q=2^(k+1)-2;
   k=x/q;
   h=y/p;
   i=0:x/q:x;
   j=0:y/p:y;

h=figure(1); %initialize the figure
clf %make the figure clean; maybe not required, but better
%view([4,-4,4]);
meshc(j,i,u);
title('Plattenverformung, perspektivisch');
xlabel ('x'); 
ylabel ('y'); 
print(h,'loesungUP.png','-dpng256');

h=figure(1); %initialize the figure
clf %make the figure clean; maybe not required, but better
title('Gewichtsfunktion, perspektivisch');
meshc(j,i,f);
xlabel ('x'); 
ylabel ('y'); 
print(h,'loesungFP.png','-dpng256');

h=figure(1); %initialize the figure
clf %make the figure clean; maybe not required, but better
[cv,ch]=contourf(i,j,f,23);
set(ch,'edgecolor','none');
title('Gewichtsfunktion, Aufsicht');
colorbar('North'); 
xlabel ('x'); 
ylabel ('y'); 
print(h,'loesungFA.png','-dpng256','-S1000,1000');

h=figure(1); %initialize the figure
clf %make the figure clean; maybe not required, but better
[cv, ch]=contourf(i,j,u,23);
set(ch,'edgecolor','none');
title('Plattenverformung, Aufsicht');
colorbar('North'); 
xlabel ('x'); 
ylabel ('y'); 
print(h,'loesungUA.png','-dpng256','-S1000,1000');
end
