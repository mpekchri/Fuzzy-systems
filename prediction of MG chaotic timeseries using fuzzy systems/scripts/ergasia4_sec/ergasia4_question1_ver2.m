% script created by Christophoros Bekos (mpekchri@auth.gr) 

%% ergasia 4
close all
create_trainning_sets;

%% define usefull data
epochs = 500;
error_goal = 0;
step_size = 0.01;
step_inc_rate = 0.9;
step_dec_rate = 1.1;
trnOpt = [epochs,error_goal,step_size,step_dec_rate,step_inc_rate];

%% define display options
disp_anfis_info = 0;
disp_error = 0;
disp_step_size = 0;
disp_results = 0;
dispOpt = [disp_anfis_info ,disp_error ,disp_step_size ,disp_results ];

%% create TSK model
fismat = genfis1(Dtrn(:,1:4),2,'gbellmf','constant');

%% train TSK model
% optMethod = 0 => backpropagation
% optMethod = 1 => hybrid
optMethod = 1;
if(optMethod==0)
    method = ' - backpropagation ';
else
    method = ' - hybrid ';
end
[trnFis, trnError, stepsize, valFis, valError] = anfis(Dtrn(:,1:4),fismat,trnOpt,dispOpt,Dval(:,1:4),optMethod);
% valFis : the fis model that fits most , both train and validation data

% train is over - deshuffle data 
Dtrn = my_deshuffle(Dtrn);
Dval = my_deshuffle(Dval);
% now remove index from matrixes Dsomething
Dtrn = Dtrn(:,1:4);
Dval = Dval(:,1:4);

%% evaluate valFis
val = evalfis(Dval(:,1:3),valFis);

trn = evalfis(Dtrn(:,1:3),valFis);
figure
plot([trn;val]);
hold on
plot([Dtrn(:,4);Dval(:,4)]);
hold off
legend('trn' , 'mg' );
title('train and validation datasets')


chk = evalfis(Dchk(:,1:3),valFis);
figure
plot(chk);
hold on
plot(Dchk(:,4));
hold off
legend('chk' , 'mg' );
title('check dataset')

%% plot learning curves
figure
plot(trnError);
title(['train error - step size : ' num2str(step_size) method ])
figure
plot(valError);
title(['check error - step size : ' num2str(step_size) method  ])

%% find error indicators
sqr_error = (Dchk(:,4) - chk).^2;
mean_x = mean(chk);
N = size(sqr_error,1);

mse = sum(sqr_error)/N;
rmse = sqrt(mse);
nmse = mse/(sum(Dchk(:,4)-mean_x));
ndei = sqrt(nmse);
[mse , rmse, nmse, abs(ndei)]

%% plot errors among iterations
figure
plot(Dchk(:,4) - chk);
title('train error among iterations on checking data')

%% plot memberships 
figure
subplot(2,2,1);
plotmf(valFis,'input',1) 
title('input`s 1 fuzzy sets')
subplot(2,2,2)
plotmf(valFis,'input',2)
title('input`s 2 fuzzy sets')
subplot(2,2,3)
plotmf(valFis,'input',3)
title('input`s 3 fuzzy sets')
