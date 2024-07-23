function[] = Euler_CS(x1, y1, h)
xn =  0.2;
x = x1:h:xn;
n = length(x);
f = @(x,y) -y;
y(1) = y1;
for i=2:n
    y(i) = y(i-1) +h*f(x(i-1), y(i-1));
disp(y(i))
end
end