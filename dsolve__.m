y=dsolve('Dy=sin(x)+y','y(0)=0','x')
x=0:0.1:5;
z=eval(y);
plot(x,z,'*')