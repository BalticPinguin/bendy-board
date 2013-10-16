function i=printu(u,x,y,k,h,f);
   p=2^(h+1)-2; %initialize dimensions and constants
   q=2^(k+1)-2;
   k=x/q;
   h=y/p;
   i=0:x/q:x;
   j=0:y/p:y;
graphics_toolkit fltk; %makes octave use its own graphical environment; with gnuplot some errors occur...
h=figure(1); %initialize the figure
clf %make the figure clean; maybe not required, but better
subplot(3,2,1); % this will be first plot with some information abaout constants and so on
   set(gca, 'visible', 'off');
   text (0, 1, {"Berechnung mit Zyklischer Blockreduktion"});
   text (0, 0.75, {"Gitterabstand x-Richtung: " x/q});
   text (0, 0.5, {"Gitterabstand y-Richtung: " y/p});
   text (0, 0.25, {"Plattengroesse: (0:" x")x(0:" y")"});
subplot(3,2,2); %second plot;
   view([4,-4,4]);
   meshc(j,i,u);
   title('Plattenverformung, perspektivisch');
   xlabel ("x"); 
   ylabel ("y"); 
subplot(3,2,3);
   view([-4,4,4]);
   surf(j,i,f);
   %colorbar("West"); 
   title('Gewichtsfunktion, perspektivisch');
   xlabel ("x"); 
   ylabel ("y"); 
subplot(3,2,4);
   view([-4,4,4]);
   surf(j,i,u);
   %colorbar("West"); 
   title('Platte, perspektivisch');
   xlabel ("x"); 
   ylabel ("y"); 
subplot(3,2,5);
   [cv,ch]=contourf(i,j,f,23);
   set(ch,'edgecolor','none');
   title('Gewichtsfunktion, Aufsicht');
   colorbar("North"); 
   xlabel ("x"); 
   ylabel ("y"); 
subplot(3,2,6);
   [cv, ch]=contourf(i,j,u,23);
   set(ch,'edgecolor','none');
   title('Plattenverformung, Aufsicht');
   colorbar("North"); 
   xlabel ("x"); 
   ylabel ("y"); 
print(h,'loesung.png','-dpng256');
end
