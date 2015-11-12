function [X, w] = FourierSeries(x, T0, k_vec)
syms t
for mm = 1:length(k_vec)
 k = k_vec(mm);
 X1(mm) = int(x*exp(-j*2*pi*k*t/T0), t, 0, T0)/T0
 % change the symbolic value to numerical value
 X(mm) = subs(X1(mm));
 w(mm) = k*2*pi/T0;
end
