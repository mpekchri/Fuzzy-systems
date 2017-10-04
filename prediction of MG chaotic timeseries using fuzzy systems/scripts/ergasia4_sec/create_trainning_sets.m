% script created by Christophoros Bekos (mpekchri@auth.gr) 

%% load Mackey-Glass solutions for t=0:3000
mg = load('mq22.dat');
mg = mg(:,2);

q = 3;
D = 6;
tau = 22;
p = 6;

No = 500;
Ntrn = No + 500 ;
Nval = Ntrn + 300 ;
Nchk = Nval + 500 ;

%% define trainning sets
% x(t+p) -> { x(t-(q-1*p)D) , x(t-(q-2*p)D) , x(t) , index} 
% Ds = [ { x(t-(q-1*p)D) , x(t-(q-2*p)D) , x(t) } , desired_output/x(t+p) , index]
% index will be used in order to plot properly after suffling

Dtrn = zeros(Ntrn-No,5);
Dval = zeros(Nval-Ntrn,5);
Dchk = zeros(Nchk-Nval,4);
c = 1;
for i=No:Ntrn-1
    Dtrn(c,:) = [mg(i-(q-1*p)*D) , mg(i-(q-2*p)*D) , mg(i) , mg(i+p) , c];
    c = c + 1;
end
c = 1;
for i=Ntrn:Nval-1
    Dval(c,:) = [mg(i-(q-1*p)*D) , mg(i-(q-2*p)*D) , mg(i) , mg(i+p), c];
    c = c + 1;
end
c = 1;
for i=Nval:Nchk-1
    Dchk(c,:) = [mg(i-(q-1*p)*D) , mg(i-(q-2*p)*D) , mg(i) , mg(i+p)];
    c = c + 1;
end

%% suffle data before training
Dtrn = my_shuffle(Dtrn);
Dval = my_shuffle(Dval);