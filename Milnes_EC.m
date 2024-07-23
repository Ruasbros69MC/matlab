function Milnes_EC(x1, y1, h)
    xn = 0.8;  % Target x value to find y(x)
    f = @(x, y) 1 + y^2;  % Given differential equation
    
    % Define the x array
    x = x1:h:xn;
    n = length(x);
    
    % Initialize y array
    y = zeros(1, n);
    y(1) = y1;
    
    % Runge-Kutta 4th order to find initial values
    for i = 1:3
        k1 = h * f(x(i), y(i));
        k2 = h * f(x(i) + h / 2, y(i) + k1 / 2);
        k3 = h * f(x(i) + h / 2, y(i) + k2 / 2);
        k4 = h * f(x(i) + h, y(i) + k3);
        y(i + 1) = y(i) + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4);
    end
    
    % Predictor Formula (Milne's method)
    for i = 4:n - 1
        y(i + 1) = y(i - 3) + (4 * h / 3) * (2 * f(x(i - 2), y(i - 2)) ...
            - f(x(i - 1), y(i - 1)) + 2 * f(x(i), y(i)));
        s(i + 1, 1) = y(i + 1);
        
        % Corrector Formula
        for j = 1:10
            s(i + 1, j + 1) = y(i - 1) + (h / 3) * (f(x(i - 1), y(i - 1)) ...
                + 4 * f(x(i), y(i)) + f(x(i + 1), s(i + 1, j)));
            if abs(s(i + 1, j + 1) - s(i + 1, j)) < 10^(-6)
                y(i + 1) = s(i + 1, j + 1);
                break
            end
        end
    end
    
    fprintf('Approximate value by Milnes method is y(%f) = %f\n', x(end), y(end));
    plot(x, y, '*');
    hold on;
    
    % Exact solution (for comparison, if known)
    syms u(x_sym);
    eqn = diff(u, x_sym) == 1 + u^2;
    cond = u(0) == 0;
    uSol = dsolve(eqn, cond);
    uSol = matlabFunction(uSol);
    fplot(uSol, [x1, xn], 'b--');
    legend('Approximate solution', 'Exact solution');
    xlabel('x');
    ylabel('y');
    title('Solution of dy/dx = 1 + y^2 using Milne’s Method');
    hold off;
end
