function[]=Milnes_EC(x1,y1,h)
xn=0.3;
f=@(x,y) x^2+y^2-2;
y(1)=y1;
x=x1:h:xn;
n=length(x);
for i=1:3
    k1=h*f(x(i),y(i));
    k2=h*f(x(i)+h/2,y(i)+k1/2);
    k3=h*f(x(i)+h/2,y(i)+k2/2);
    k4=h*f(x(i)+h,y(i)+k3);
    y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
end
% predictor Formula
for i=4:n-1
    y(i+1)=y(i-3)+(4*h/3)*(2*f(x(i-2),y(i-2))...
    -f(x(i-1),y(i-1))+2*f(x(i),y(i)));
s(i+1,1)=y(i+1);
% correctors  Formula
for j=1:10
s(i+1,j+1)=y(i-1)+(h/3)*(f(x(i-1),y(i-1))...
    +4*f(x(i),y(i))+f(x(i+1),s(i+1,j)));
if abs(s(i+1,j+1)-s(i+1,j)) <10^(-6)
    y(i+1)=s(i+1,j+1);
    break
end
end
end
fprintf('App. value by Milnes method is y(%f)=%f',x(end),y(end))
plot(x,y,'*')
u=dsolve('Dy=x^2+y^2-2','y(-0.1)=1.0900','x');
u=eval(u);
hold on
plot(x,u,'b--')
end

    


