function [ ] = RK_2(h,x0,y0,xn)
F = @(x, y) (y-x);                                                      
x = x0:h:xn;                                                         
y(1) = y0; 
n=length(x);
for i=1:n-1                                                         
    k1 =h* F(x(i),y(i));
    k2 =h* F((x(i)+h),(y(i)+k1));
    y(i+1) = y(i) + (1/2)*(k1+k2)  
end
plot(x, y)  
