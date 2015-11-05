clear all

syms t;
tau = 1;
T0 = 5;
k_vec = [-4:4];
xt = heaviside(t+tau/2)-heaviside(t-tau/2) + heaviside(t-(T0-tau/2))-heaviside(t-(T0+tau/2));
[Xw, w] = FourierSeries(xt, T0, k_vec);
stem(w,abs(Xw), 'o-');
hold on;
Xw_manual = tau/T0*sinc(k_vec*tau/T0);
stem(w, abs(Xw_manual), 'r--');
legend('Matlab calculation', 'Manual calculation');
