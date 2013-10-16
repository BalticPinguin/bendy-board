function i=printu(u,x,y,k,h);

i=0:h:x;
j=0:k:y;
figure; foo=mesh(j,i,u);
title('Differentialgleichung');
print -dpng 'digglei500.png';
