[T,Y]=meshgrid(-2:0.2:2, -2:0.2:2);
S= (T+Y+1)./(Y-T);
L= sqrt(1+S.^2);
quiver(T,Y,1./L,S./L,0.45)
axis tight; xlabel('t'), ylabel('y')
title('Direction field for dy/dt = t/y')