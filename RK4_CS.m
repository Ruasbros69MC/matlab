% solve dy/dx=x+y y(0)=1, find y at x=0.2 by taking h=0.1
function[x,y]=RK4_CS(x1,y1,h)
xn=0.4;
f=@(x,y) (1+y^2);
y(1)=y1;
x=x1:h:xn;
n=length(x);
for i=2:n
    k1=h*f(x(i-1),y(i-1))
    k2=h*f(x(i-1)+h/2,y(i-1)+k1/2)
    k3=h*f(x(i-1)+h/2,y(i-1)+k2/2)
    k4=h*f(x(i-1)+h,y(i-1)+k3)
    y(i)=y(i-1)+(1/6)*(k1+2*k2+2*k3+k4)
end
plot(x,y,'r')
hold on
u=dsolve('Dy=1+y^2','y(0)=0','x');
u=eval(u);
plot(x,u,'r*')
legend('RK4 sol.', 'Exact sol.')
end