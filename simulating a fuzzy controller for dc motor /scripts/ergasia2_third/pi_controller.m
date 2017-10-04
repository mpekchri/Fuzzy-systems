n = [18.69];
d = [1 12.064];

Gs = tf(n,d);

kp = 1;
ki = 13.5;
kd = 0;

Hs = pid(kp,ki,kd);

H = [1];
Yc = feedback(Hs*Gs,H);
step(Yc); 
stepinfo(Yc)

% pzmap(Yc)

% evaluate transfer function at given f :
frsp = evalfr(Yc,1/(2*pi)*1i);  % w = 1 => f = 1/(2*pi)
20*log10(1/(abs(1+frsp)))   % must be <= 20 dB

% nyquist(Yc)

% simulate responce to input u(t) for 2 sec
% t = 0:0.01:2;   
% u = heaviside(t-1);
% lsimplot(Yc,u,t) ; grid on