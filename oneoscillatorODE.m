% Given parameters and data

V = linspace(-0.48, 0.9, 298);
I = msh_array(1:298, 2) * 1e-3;
L = 1e-3;
C =1e-9; 


ind_0 = find(V >= 0, 1);
dV=mean(diff(V));

tspan = [0, tmax];
V_0=0;
y0 = [V_0; 0];
dydt = @(t, y) odefunc(t, y, V, I, L, C);
[t, y] = ode45(dydt, tspan, y0);
VL = y(:, 1);
iL = y(:, 2);
plot(t, VL, 'linewidth', 2);
xlabel('Time');
ylabel('VL');
toc;