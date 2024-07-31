y0=3;
xspan=[0,3];
f=@(x,y) x^2+y^2;
[x,y]=ode45(f,xspan,y0);
plot(x,y,'r','LineWidth',2)
