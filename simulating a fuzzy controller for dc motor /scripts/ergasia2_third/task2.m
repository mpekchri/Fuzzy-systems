%% initiall values ,changed after tunning
% a = 0.150;
% K = 0.028;
% Ke = 0.5;
% Kd = a*Ke;
% Ts = 0.01;

%% after tunning values
a = -0.41;
K = 11.7;
Ke = -0.0038;
Kd = a*Ke;
Ts = 0.01;

input = timeseries( 150.*trapmf([0:1:30],[0 10 20 30]) );   

%% use them AFTER you run simulation in simulink
% time = ScopeData(:,1);
% ustep = ScopeData(:,2);
% pi = ScopeData(:,3);
% plot(ustep)
% hold on
% plot(pi)
% hold off
% legend('input' , 'system response')
% xlabel('time in milliseconds')
% ylabel('volt')