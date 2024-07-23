function[x,y] = Adams_method(x0, y0, xn, n)
h = (xn-x0)/n;
f = @(x,y) 1+y^2;
x = x0:h:xn;
y = zeros(1,n);
maxit = 10;
s(:,:) = zeros(n,maxit);
y(1) = y0;
for i=1:3
    k1 = h*f(x(i), y(i));
    k2 = h*f(x(i)+0.5*h, y(i)+0.5*k1);
    k3 = h*f(x(i)+0.5*h, y(i)+0.5*k2);
    k4 = h*f(x(i)+h, y(i)+k3);
    y(i+1) = y(i)+(1/6)*(k1+ 2*k2 +2*k3 +k4);
end
for i=4:n
    y(i+1) = y(i)+(h/24)*(55*f(x(i), y(i)) - 59*f(x(i-1), y(i-1))+ 37*f(x(i-2), y(i-2))- 9*f(x(i-3), y(i-3)));
    s(i+1, 1) = y(i+1);
    for j=1:maxit
        s(i+1,j+1)= y(i)+(h/24)*(f(x(i-2),y(i-2)) - 5*f(x(i-1), y(i-1))+ 19*f(x(i), y(i) + 9*f(x(i+1), s(i+1,j))));
        if (s(i+1, j+1)-s(i+1,j))<10^(-6)
            y(i+1) = s(i+1, j+1);
            break
        end
    end
end
plot(x,y,'b*')
hold on 
u = eval(dsolve('Dy = 1+y^2', 'y(0)=0','x'));
disp(u)
plot(x,y,'r')
end
