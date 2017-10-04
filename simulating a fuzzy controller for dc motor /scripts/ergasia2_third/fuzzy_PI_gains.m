%% fuzzy gains
kp = 1;
ki = 13.5;

a = kp/ki;

Ke = 1;
K = kp/F(a,Ke,1);
Kd = a;

Ts = 0.01;

% after tunning
% K = 0.02;
% Ke = 0.585;
% Kd = 0.14;
a = 0.150;
K = 0.028;
Ke = 0.5;
Kd = a*Ke;
    
input = timeseries([ones(10,1)*150;ones(10,1)*100;ones(10,1)*150]);   