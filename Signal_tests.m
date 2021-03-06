clear all;
f = 400;
Tsample = 1/f;
t = 0:Tsample:1;
A = 1;
x = sin(2*pi*t);
y1 = x.^2;
y2 = x.*(1+2*x);
y3 = x.*sin(2*pi*350.*t);
plot(t,y1,t,y2,t,y3);
n1 = .5;
x2 = 12*n1 + 12*n1 - 24*n1; %Proves Linearity
subplot(3,1,1);
plot(t,y1);
title('Plot of x^2(t)');
subplot(3,1,2);
plot(t,y2);
title('Plot of x(t)[1+2x(t)');
subplot(3,1,3);
plot(t,y3);
title('Plot of x(t)sin(2*pi*350*t)');
figure;
n = 2;
S = @(x) x.^n;
interval1 = 1:1/100:4;
interval2 = 11:1/100:14;
Test1 = S(interval1) + S(interval2);
Test2 = S(interval1 + interval2);
TestResult = isequal(Test1,Test2);
S2 = @(x) x.*(1+2*x);
Test1 = S2(interval1) + S2(interval2);
Test2 = S2(interval1 + interval2);
TestResult2 = isequal(Test1,Test2);
S3 = @(x) x.*sin(2*pi*350.*t);
%-------------------------------------------------------------------------%
t = -2:1/1000:2;
t1 = -2:1/2000:2;
t2 = -2:1/4000:2;
p = (heaviside(t+1) - heaviside(t-1));
p1 = (10^-3)*conv(p,p);
p2 = (10^-3)*conv(p1,p1);
subplot(3,1,1);
plot(t,p);
title('Convolution of P');
subplot(3,1,2);
plot(t1,p1);
title('Convolution of P1');
subplot(3,1,3);
plot(t2,p2);
title('Convolution of P2');

