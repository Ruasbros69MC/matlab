function []=Eulermod(x1,y1,h,xn)
f=@(x,y) x^2 +y;
x=x1:h:xn;
n=length(x);
y(1)=y1;
yp(1)=y1;
maxit=10;
for i=2:n
    yp(i)=y(i-1)+h*f(x(i-1),y(i-1));
    s(i,1)=yp(i);
    for j=2:maxit
        s(i,j)=y(i-1)+(h/2)*(f(x(i-1),y(i-1))+f(x(i),s(i,j-1)));
        if abs(s(i,j)-s(i,j-1))<10^(-6)
            y(i)=s(i,j);
            break
        end
    end
end
fprintf('Appr. sol. y(%f)=%f',x(end),y(end))
plot(x,yp,'m--')
hold on
plot(x,y,'m--')
hold on
plot(x,y,'r*')
hold on
u=dsolve('Dy=x^2+y','y(x1)=y1','x');
u=eval(u)
plot(x,u,'b--')
legend('Appr. sol. by Euler','Appr. sol. by Modified Euler','Exact sol.')
end