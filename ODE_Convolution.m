clear all;
clc;
 
 
u = 0:.01:1;
t = 0:.01:1;
yt = {[1 5]};
xt = {[2]};
H = tf(xt,yt);
 
%Part 1a using lsim
figure;
lsim(H, u, t);
figure;
step(H);
%Part 1b using step
 
t6 = -2:.001:2;
x = exp(-5.*t).*heaviside(t);
ut = heaviside(t6);
 
figure;
subplot(2,1,1);
plot(t,x);
title('exp(-5.*t)');
subplot(2,1,2);
plot(t6,ut);
title('u(t)');
 
[y2,t2] = impulse(H,t);
s_c = conv(x,y2);
w = downsample(s_c,2);
figure;
plot(t2,w);
title('Convolution of the Impulse function');
 
yt2 = [1 4 4];
xt2 = [1 1];
sys2 = tf(xt2,yt2);
figure;
lsim(sys2,u,t);
figure;
step(sys2);
[y3,t3] = impulse(sys2,t);
s_c2 = conv(x,y3);
w2 = downsample(s_c2,2);
figure;
plot(t3,w2);
title('Convolution of the SECOND Impulse function');
 
initial = 0;
[t2,x2]=ode45(@rhs,t,initial);
figure;
plot(t2,x2);
title('ODE 45 of the SECOND Differential Equation');
