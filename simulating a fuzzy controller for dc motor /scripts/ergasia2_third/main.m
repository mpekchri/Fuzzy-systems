%% fuzzy controller's properties
% fuzzifier          -> singleton   
% binder AND         -> min         -> Implication method = 'min'
% binder ALSO        -> max         -> Aggregation method = 'max'
% inference function -> mamdani     -> FISType = 'mamdani'
% defuzzifier        -> COS         -> DefuzzificationMethod method = 'centroid'

%% create such a fuzzy inference system
myfis = newfis('fis','mamdani','min','max','min','max','centroid');

%% add variables 
myfis = addvar(myfis,'input','E',[-1 1]);        % varIndex = 1
myfis = addvar(myfis,'input','dE',[-1 1]);       % varIndex = 2
myfis = addvar(myfis,'output','dU',[-150 150]);  % varIndex = 1

%% add membership functions
% for input E we have :
myfis = addmf(myfis,'input',1,'ZR','trimf',[-1/4,0,1/4]);
myfis = addmf(myfis,'input',1,'PS','trimf',[0,1/4,2/4]);
myfis = addmf(myfis,'input',1,'PM','trimf',[1/4,2/4,3/4]);
myfis = addmf(myfis,'input',1,'PL','trimf',[2/4,3/4,1]);
myfis = addmf(myfis,'input',1,'PV','trimf',[3/4,1,1]);
myfis = addmf(myfis,'input',1,'NS','trimf',[-2/4,-1/4,0]);
myfis = addmf(myfis,'input',1,'NM','trimf',[-3/4,-2/4,-1/4]);
myfis = addmf(myfis,'input',1,'NL','trimf',[-4/4,-3/4,-2/4]);
myfis = addmf(myfis,'input',1,'NV','trimf',[-1,-1,-3/4]);
% same stuff for input dE we have :
myfis = addmf(myfis,'input',2,'ZR','trimf',[-1/4,0,1/4]);
myfis = addmf(myfis,'input',2,'PS','trimf',[0,1/4,2/4]);
myfis = addmf(myfis,'input',2,'PM','trimf',[1/4,2/4,3/4]);
myfis = addmf(myfis,'input',2,'PL','trimf',[2/4,3/4,1]);
myfis = addmf(myfis,'input',2,'PV','trimf',[3/4,1,1]);
myfis = addmf(myfis,'input',2,'NS','trimf',[-2/4,-1/4,0]);
myfis = addmf(myfis,'input',2,'NM','trimf',[-3/4,-2/4,-1/4]);
myfis = addmf(myfis,'input',2,'NL','trimf',[-4/4,-3/4,-2/4]);
myfis = addmf(myfis,'input',2,'NV','trimf',[-1,-1,-3/4]);
% for the output dU we have :
myfis = addmf(myfis,'output',1,'ZR','trimf',[-150/3,0,150/3]);
myfis = addmf(myfis,'output',1,'PS','trimf',[0,150/3,300/3]);
myfis = addmf(myfis,'output',1,'PM','trimf',[150/3,300/3,150]);
myfis = addmf(myfis,'output',1,'PL','trimf',[300/3,150,150]);
myfis = addmf(myfis,'output',1,'NS','trimf',[-300/3,-150/3,0]);
myfis = addmf(myfis,'output',1,'NM','trimf',[-150,-2*150/3,-1*150/3]);
myfis = addmf(myfis,'output',1,'NL','trimf',[-150,-150,-2*150/3]);

%% plot inputs/outputs for debug
% figure
% plotmf(myfis,'input',1);
% figure
% plotmf(myfis,'input',2);
% figure
% plotmf(myfis,'output',1);

%% add rules
% r1 = [1 9 4 1 1];         % if E is 1 (NV) , AND dE is 9 (PV) ,THEN dU is 4 (ZR)
% r1 = [e de 4 1 1];
rule_list = ones(9*9,5);    % 9x9 rules in total for dE x E    
counter = 1;
const = 4-1;
for de=9:-1:1
   for e=1:9
        rule_list(counter,:) = [e, de, (e+const), 1, 1];
        counter = counter +1;
   end
   const = const - 1;
end
r = rule_list(:,3);
r(r>7) = 7;
r(r<1) = 1;
rule_list(:,3) = r;

myfis = addrule(myfis,rule_list);
% gensurf(myfis)                    % visualize result

%% save our system 
% writefis(myfis,'fis');

%% evaluate fis when e = PS and de = NS
