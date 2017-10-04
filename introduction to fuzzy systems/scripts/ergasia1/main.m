% script created by Christophoros Bekos (mpekchri@auth.gr) 

%% define operators and usefull variables
more_or_less = @(x) sqrt(x);
very = @(x) x.^2;
steps = 100;

%% construct the signals
% doesn't really matter what values we will give them as long as
% their values don't exceed the limits defined in report.pdf
x1 = (0:1/steps:1);
x2 = (0:50/steps:50);
y = (0:1400/steps:1400);

%% construct fuzzy sets as described in repord.pdf
X1_small = trapmf(x1,[0,0,0.25,0.75]);
X1_large = trapmf(x1,[0.25,0.75,1,1]);
X2_small = trapmf(x2,[0,0,10,40]);
X2_large = trapmf(x2,[10,40,50,50]);
B1 = trimf(y,[0,0,11]);
B2 = trimf(y,[0,11,130]);
B3 = trimf(y,[11,130,800]);
B4 = trapmf(y,[130,800,1400,1400]);

%% construct input fuzzy sets
X1_in = more_or_less(X1_large);
X2_in = very(X2_large);

%% construct the DOF of each Rule for those inputs
wr1 = min(X1_in.*X1_small,X2_in.*X2_small);
wr2 = min(X1_in.*X1_small,X2_in.*X2_large);
wr3 = min(X1_in.*X1_large,X2_in.*X2_small);
wr4 = min(X1_in.*X1_large,X2_in.*X2_large);

%% construct the individual conclusions of the rules
r1 = wr1.*B1;
r2 = wr2.*B2;
r3 = wr3.*B3;
r4 = wr4.*B4;

%% construct the output
r = max(max(r1,r2),max(r3,r4));

%% get singleton output using CAD defuzzifier
y1 = centerOfMass(r1);
y2 = centerOfMass(r2);
y3 = centerOfMass(r3);
y4 = centerOfMass(r4);
y_i = [y1,y2,y3,y4];
w_i = [max(r1),max(r2),max(r3),max(r4)];
sum1 = sum(y_i.*w_i);
sum2 = sum(w_i);
y_singleton = sum1/sum2;

%% compare CAD and COA
cad_result = y_singleton;
disp(['cad result is ',num2str(cad_result)]);
% in order to compare , download centerOfMass() function
% from here : https://www.mathworks.com/matlabcentral/fileexchange/41675-center-of-mass
% and remove the following comments : 
%
coa_result = max(centerOfMass(r));
disp(['coa result is ',num2str(coa_result)]);

%% plot rules, DOFs and fuzzy result
figure
plot(X1_small);
hold on
plot(X1_large);
hold off
title('x_1`s fuzzy sets')

figure
plot(X2_small);
hold on
plot(X2_large);
hold off
title('x_2`s fuzzy sets')

figure
plot(B1);
hold on
plot(B2);
plot(B3);
plot(B4);
hold off
title('y`s fuzzy sets')

figure
plot(X1_small);
hold on
plot(X1_large);
plot(X1_in);
hold off
legend('x_1`s S','x_1`s L','A_1` input')

figure
plot(X2_small);
hold on
plot(X2_large);
plot(X2_in);

hold off
legend('x_2`s S','x_2`s L','A_2` input')

figure 
plot(r1)
hold on
plot(r2)
plot(r3)
plot(r4)
hold off
legend('rule1`s dof','rule2`s dof','rule3`s dof','rule4`s dof');

figure
plot(r);
title('fuzzy outut')
