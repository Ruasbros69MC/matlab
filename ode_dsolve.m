y=dsolve('Dy=x^2+y^2','y(1)=3','x')
x=0:0.1:3;
z=eval(y);
plot(x,z,'*')
hold on
y0=3;
xspan=[0,3];
f=@(x,y) x^2+y^2;
[x,y]=ode45(f,xspan,y0);
plot(x,y,'r','LineWidth',2)
