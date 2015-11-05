Amp = 4;
Period = 2;
t = -4:0.01:4;
sawtooth = 2*Amp/pi*atan(tan(pi*t/Period));
plot(t,sawtooth);
