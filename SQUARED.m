
t = linspace(0, 10, 100);
x= sin(t);
y = square(t);

figure(1)
plot(x)
grid on
hold on
plot(y)

t = linspace(-pi,2*pi,121);
x = 1.15*square(2*t);

figure(2)
plot(t/pi,x,'.-',t/pi,1.15*sin(2*t))
xlabel('t / \pi')
grid on