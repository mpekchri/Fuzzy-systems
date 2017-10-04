% script created by Christophoros Bekos (mpekchri@auth.gr) 

%% fuzzy controller's properties
% fuzzifier          -> singleton   
% binder AND         -> min         -> Implication method = 'min'
% binder ALSO        -> max         -> Aggregation method = 'max'
% inference function -> mamdani     -> FISType = 'mamdani'
% defuzzifier        -> COS         -> DefuzzificationMethod method = 'centroid'

%% create such a fuzzy inference system
fis = newfis('fis','mamdani','min','max','min','max','centroid');

%% add variables 
fis = addvar(fis,'input','dv',[0 1]);        % varIndex = 1
fis = addvar(fis,'input','dh',[0 1]);       % varIndex = 2
fis = addvar(fis,'input','theta',[-180 180]);       % varIndex = 3
fis = addvar(fis,'output','dtheta',[-130 130]);  % varIndex = 1

%% add membership functions
% for inputs we have :
fis = addmf(fis,'input',1,'VS','trimf',[0,0,0.25]);
fis = addmf(fis,'input',1,'S','trimf',[0,0.25,0.5]);
fis = addmf(fis,'input',1,'M','trimf',[0.25,0.5,0.75]);
fis = addmf(fis,'input',1,'L','trimf',[0.5,0.75,1]);
fis = addmf(fis,'input',1,'VL','trimf',[0.75,1,1]);

fis = addmf(fis,'input',2,'VS','trimf',[0,0,0.25]);
fis = addmf(fis,'input',2,'S','trimf',[0,0.25,0.5]);
fis = addmf(fis,'input',2,'M','trimf',[0.25,0.5,0.75]);
fis = addmf(fis,'input',2,'L','trimf',[0.5,0.75,1]);
fis = addmf(fis,'input',2,'VL','trimf',[0.75,1,1]);

fis = addmf(fis,'input',3,'NL','trimf',[-180,-180,-90]);
fis = addmf(fis,'input',3,'NS','trimf',[-180,-90,0]);
fis = addmf(fis,'input',3,'ZE','trimf',[-90,0,90]);
fis = addmf(fis,'input',3,'PS','trimf',[0,90,180]);
fis = addmf(fis,'input',3,'PS','trimf',[90,180,180]);

% for the output
fis = addmf(fis,'output',1,'NL','trimf',[-150,-150,-75]);
fis = addmf(fis,'output',1,'NS','trimf',[-150,-75,0]);
fis = addmf(fis,'output',1,'ZE','trimf',[-75,0,75]);
fis = addmf(fis,'output',1,'PS','trimf',[0,75,150]);
fis = addmf(fis,'output',1,'PL','trimf',[75,150,150]);


%% plot inputs/outputs for debug
% figure
% plotmf(fis,'output',1);

%% add rules
rule_list = zeros(125,6);
% case theta == NL 
            %     v,h,t,y,.,.
rule_list(1,:) = [1,1,1,3,1,1];
rule_list(2,:) = [2,1,1,3,1,1];
rule_list(3,:) = [3,1,1,3,1,1];
rule_list(4,:) = [4,1,1,3,1,1];
rule_list(5,:) = [5,1,1,3,1,1];

rule_list(6,:) = [1,2,1,2,1,1];
rule_list(7,:) = [2,2,1,1,1,1];
rule_list(8,:) = [3,2,1,4,1,1]; % 4 or 5 ? 
rule_list(9,:) = [4,2,1,5,1,1];
rule_list(10,:)= [5,2,1,5,1,1];

rule_list(11,:)= [1,3,1,1,1,1];
rule_list(12,:)= [2,3,1,5,1,1];
rule_list(13,:)= [3,3,1,5,1,1];
rule_list(14,:)= [4,3,1,5,1,1];
rule_list(15,:)= [5,3,1,5,1,1];

rule_list(16,:)= [1,4,1,1,1,1];
rule_list(17,:)= [2,4,1,1,1,1];
rule_list(18,:)= [3,4,1,1,1,1];
rule_list(19,:)= [4,4,1,1,1,1];
rule_list(20,:)= [5,4,1,1,1,1];

rule_list(21,:)= [1,5,1,1,1,1];
rule_list(22,:)= [2,5,1,1,1,1];
rule_list(23,:)= [3,5,1,1,1,1];
rule_list(24,:)= [4,5,1,1,1,1];
rule_list(25,:)= [5,5,1,1,1,1];

% case theta == NS 
            %     v,h,t,y,.,.
rule_list(26,:)= [1,1,2,5,1,1];
rule_list(27,:)= [2,1,2,5,1,1];
rule_list(28,:)= [3,1,2,5,1,1];
rule_list(29,:)= [4,1,2,5,1,1];
rule_list(30,:)= [5,1,2,5,1,1];  % changed 3rd attempt

rule_list(31,:)= [1,2,2,5,1,1];
rule_list(32,:)= [2,2,2,5,1,1];  % changed 3rd attempt
rule_list(33,:)= [3,2,2,5,1,1];  % changed 3rd attempt
rule_list(34,:)= [4,2,2,4,1,1];
rule_list(35,:)= [5,2,2,4,1,1];

rule_list(36,:)= [1,3,2,5,1,1];
rule_list(37,:)= [2,3,2,4,1,1];
rule_list(38,:)= [3,3,2,4,1,1];
rule_list(39,:)= [4,3,2,4,1,1];
rule_list(40,:)= [5,3,2,4,1,1];

rule_list(41,:)= [1,4,2,5,1,1];
rule_list(42,:)= [2,4,2,4,1,1];
rule_list(43,:)= [3,4,2,4,1,1];
rule_list(44,:)= [4,4,2,4,1,1];
rule_list(45,:)= [5,4,2,4,1,1];

rule_list(46,:)= [1,5,2,5,1,1];
rule_list(47,:)= [2,5,2,4,1,1];
rule_list(48,:)= [3,5,2,4,1,1];
rule_list(49,:)= [4,5,2,4,1,1];
rule_list(50,:)= [5,5,2,4,1,1];

% case theta == ZE 
            %     v,h,t,y,.,.
rule_list(51,:)= [1,1,3,5,1,1];  % changed
rule_list(52,:)= [2,1,3,5,1,1];  % changed
rule_list(53,:)= [3,1,3,5,1,1];  % changed
rule_list(54,:)= [4,1,3,5,1,1];  % changed 3rd attempt 
rule_list(55,:)= [5,1,3,5,1,1];

rule_list(56,:)= [1,2,3,5,1,1];  % changed
rule_list(57,:)= [2,2,3,5,1,1];  % changed
rule_list(58,:)= [3,2,3,3,1,1];  % dont change this, very important rule !!
rule_list(59,:)= [4,2,3,3,1,1]; 
rule_list(60,:)= [5,2,3,3,1,1];

rule_list(61,:)= [1,3,3,3,1,1];
rule_list(62,:)= [2,3,3,3,1,1];
rule_list(63,:)= [3,3,3,3,1,1];
rule_list(64,:)= [4,3,3,2,1,1];
rule_list(65,:)= [5,3,3,2,1,1];

rule_list(66,:)= [1,4,3,3,1,1];
rule_list(67,:)= [2,4,3,3,1,1];
rule_list(68,:)= [3,4,3,2,1,1];
rule_list(69,:)= [4,4,3,2,1,1];
rule_list(70,:)= [5,4,3,2,1,1];

rule_list(71,:)= [1,5,3,3,1,1];
rule_list(72,:)= [2,5,3,3,1,1];
rule_list(73,:)= [3,5,3,2,1,1];
rule_list(74,:)= [4,5,3,2,1,1];
rule_list(75,:)= [5,5,3,1,1,1];

% case theta == PS
            %   v,h,t,y,.,.
rule_list(76,:)= [1,1,4,5,1,1];  % changed 
rule_list(77,:)= [2,1,4,4,1,1];  % changed 3rd attempt 
rule_list(78,:)= [3,1,4,3,1,1];  % changed 3rd attempt
rule_list(79,:)= [4,1,4,3,1,1];
rule_list(80,:)= [5,1,4,2,1,1];

rule_list(81,:)= [1,2,4,5,1,1];  % changed
rule_list(82,:)= [2,2,4,3,1,1];  % changed 3rd attempt
rule_list(83,:)= [3,2,4,3,1,1];  % changed 3rd attempt 
rule_list(84,:)= [4,2,4,3,1,1];  % changed 3rd attempt
rule_list(85,:)= [5,2,4,2,1,1];

rule_list(86,:)= [1,3,4,4,1,1];  % changed
rule_list(87,:)= [2,3,4,3,1,1]; 
rule_list(88,:)= [3,3,4,2,1,1];
rule_list(89,:)= [4,3,4,2,1,1];
rule_list(90,:)= [5,3,4,1,1,1];

rule_list(91,:)= [1,4,4,3,1,1];
rule_list(92,:)= [2,4,4,3,1,1];
rule_list(93,:)= [3,4,4,2,1,1];
rule_list(94,:)= [4,4,4,1,1,1];
rule_list(95,:)= [5,4,4,1,1,1];

rule_list(96,:)= [1,5,4,3,1,1];
rule_list(97,:)= [2,5,4,2,1,1];
rule_list(98,:)= [3,5,4,2,1,1];
rule_list(99,:)= [4,5,4,1,1,1];
rule_list(100,:)=[5,5,4,1,1,1];

% case theta == PL
            %     v,h,t,y,.,.
rule_list(101,:) = [1,1,5,3,1,1];
rule_list(102,:) = [2,1,5,3,1,1];
rule_list(103,:) = [3,1,5,3,1,1];
rule_list(104,:) = [4,1,5,3,1,1];
rule_list(105,:) = [5,1,5,3,1,1];

rule_list(106,:) = [1,2,5,2,1,1];
rule_list(107,:) = [2,2,5,1,1,1];
rule_list(108,:) = [3,2,5,4,1,1]; % 4 or 5 ? 
rule_list(109,:) = [4,2,5,5,1,1];
rule_list(110,:)=  [5,2,5,5,1,1];

rule_list(111,:)= [1,3,5,1,1,1];
rule_list(112,:)= [2,3,5,5,1,1];
rule_list(113,:)= [3,3,5,5,1,1];
rule_list(114,:)= [4,3,5,5,1,1];
rule_list(115,:)= [5,3,5,5,1,1];

rule_list(116,:)= [1,4,5,1,1,1];
rule_list(117,:)= [2,4,5,1,1,1];
rule_list(118,:)= [3,4,5,1,1,1];
rule_list(119,:)= [4,4,5,1,1,1];
rule_list(120,:)= [5,4,5,1,1,1];

rule_list(121,:)= [1,5,5,1,1,1];
rule_list(122,:)= [2,5,5,1,1,1];
rule_list(123,:)= [3,5,5,1,1,1];
rule_list(124,:)= [4,5,5,1,1,1];
rule_list(125,:)= [5,5,5,1,1,1];

fis = addrule(fis,rule_list);

%% save our system 
% writefis(fis,'fis_second_attempt');
