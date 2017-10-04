% script created by Christophoros Bekos (mpekchri@auth.gr) 

%% question 5
for_q5
close all

P = 96;
x = mg;

N = 500;
values = zeros(N,1);

for t = No:No+N
    D = zeros(P/p,4);
    index = zeros(P/p,1);
    d = [Dtrn(:,1:4);Dval(:,1:4);Dchk(:,1:4)];
    x_t_6 = evalfis(d(t+p-No,1:3),valFis);
    D(1,1:3) = [x(t-p),x(t),x_t_6];
    D(1,4) = evalfis(D(1,1:3),valFis);            % D(1) = estimation of x(t+12)
    index(1) = t+p;
    D(2,1:3) = [x(t),x_t_6,D(1,4)];
    D(2,4) = evalfis(D(2,1:3),valFis);            % D(2) = estimation of x(t+18)
    index(2) = t+2*p;
    D(3,1:3) = [x_t_6,D(1,4),D(2,4)];
    D(3,4) = evalfis(D(3,1:3),valFis);            % D(3) = estimation of x(t+24)
    index(3) = t+3*p;
    for i=4:P/p
        D(i,1:3) = [D(i-q,4) , D(i-q+1,4) , D(i-q+2,4)];
        D(i,4) = evalfis(D(i,1:3),valFis);
        index(i) = t+i*p;
    end
    values(t-No+1) = D(P/p,1);
end

figure
plot(values,'.');
hold on
plot(x(No+P:No+P+N),'.');
hold off
legend('TSK`s estimations','MQ timeseries values')

error = x(No+P:No+P+N) - values;
figure
plot(error)

%% find error indicators
sqr_error = error.^2;
mean_x = mean(chk);
N = size(sqr_error,1);

mse = sum(sqr_error)/N;
rmse = sqrt(mse);
nmse = mse/(sum(Dchk(:,4)-mean_x));
ndei = sqrt(nmse);
[mse , rmse, nmse, abs(ndei)]