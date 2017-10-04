%% after tunning values
a = 0.150;
K = 0.028;
Ke = 0.5;
Kd = a*Ke;
Ts = 0.01;
    
input = timeseries([ones(10,1)*150;ones(10,1)*100;ones(10,1)*150]);   

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