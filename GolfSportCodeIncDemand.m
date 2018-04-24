tic;
vars = {'C1','C2','C3','G1','G2','G3','T1','T2','T3'};


%set a variable to each product with zero lower bounds if applicable

s = optimvar('s',vars,'lowerbound',0,'type','integer');
g = optimvar('g',vars,'lowerbound',0,'type','integer');
i = optimvar('i',vars,'lowerbound',0,'type','integer');
w = optimvar('w',vars,'lowerbound',0,'type','integer');
h = optimvar('h',vars,'lowerbound',0,'type','integer');
v = optimvar('v',vars,'lowerbound',0,'type','integer');
x = optimvar('x',vars,'lowerbound',0,'type','integer');
y = optimvar('y',vars,'lowerbound',0,'type','integer');
z = optimvar('z',vars,'lowerbound',0,'type','integer');
e = optimvar('e','lowerbound',0);


% set each product's minimal and maximal by plant only upper bounds for period 1

s('C1').UpperBound = 3000;
s('G1').UpperBound = 3000;
s('T1').UpperBound = 3000;

g('C1').LowerBound = 100;
g('G1').LowerBound = 100;
g('T1').LowerBound = 50;
g('C1').UpperBound = 3000;
g('G1').UpperBound = 3000;
g('T1').UpperBound = 3000;

i('C1').LowerBound = 200;
i('G1').LowerBound = 200;
i('T1').LowerBound = 100;
i('C1').UpperBound = 3000;
i('G1').UpperBound = 3000;
i('T1').UpperBound = 3000;

w('C1').LowerBound = 30;
w('G1').LowerBound = 30;
w('T1').LowerBound = 15;
w('C1').UpperBound = 3000;
w('G1').UpperBound = 3000;
w('T1').UpperBound = 3000;

h('C1').LowerBound = 100;
h('G1').LowerBound = 100;
h('T1').LowerBound = 100;
h('C1').UpperBound = 3000;
h('G1').UpperBound = 3000;
h('T1').UpperBound = 3000;

v('C1').UpperBound = 300;
v('G1').UpperBound = 300;
v('T1').UpperBound = 300;

x('C1').UpperBound = 150;
x('G1').UpperBound = 150;
x('T1').UpperBound = 150;

y('C1').UpperBound = 450;
y('G1').UpperBound = 450;
y('T1').UpperBound = 450;

z('C1').UpperBound = 600;
z('G1').UpperBound = 600;
z('T1').UpperBound = 600;

%Set objective to maximize profit

prob = optimproblem('ObjectiveSense','max');
prob.Objective = (10*s('C1')+10*s('C2')+10*s('C3')+10*s('G1')+10*s('G2')+10*s('G3')+12*s('T1')+12*s('T2')+12*s('T3')...
	+25*g('C1')+25*g('C2')+25*g('C3')+25*g('G1')+25*g('G2')+25*g('G3')+30*g('T1')+30*g('T2')+30*g('T3')...
	+8*i('C1')+8*i('C2')+8*i('C3')+8*i('G1')+8*i('G2')+8*i('G3')+10*i('T1')+10*i('T2')+10*i('T3')...
	+18*w('C1')+18*w('C2')+18*w('C3')+18*w('G1')+18*w('G2')+18*w('G3')+22*w('T1')+22*w('T2')+22*w('T3')...
	+40*h('C1')+40*h('C2')+40*h('C3')+40*h('G1')+40*h('G2')+40*h('G3')+45*h('T1')+45*h('T2')+45*h('T3')...
	+290*v('C1')+290*v('C2')+290*v('C3')+290*v('G1')+290*v('G2')+290*v('G3')+310*v('T1')+310*v('T2')+310*v('T3')...
	+380*x('C1')+380*x('C2')+380*x('C3')+380*x('G1')+380*x('G2')+380*x('G3')+420*x('T1')+420*x('T2')+420*x('T3')...
	+560*y('C1')+560*y('C2')+560*y('C3')+560*y('G1')+560*y('G2')+560*y('G3')+640*y('T1')+640*y('T2')+640*y('T3')...
	+650*z('C1')+650*z('C2')+650*z('C3')+650*z('G1')+650*z('G2')+650*z('G3')+720*z('T1')+720*z('T2')+720*z('T3'))...
	%End Revenue Start Cost Period 1
	-(6*s('C1')+6*s('C3')+5*s('G1')+5*s('G3')+7*s('T1')+7*s('T3')...
	+19*g('C1')+19*g('C3')+18*g('G1')+18*g('G3')+20*g('T1')+20*g('T3')...
	+4*i('C1')+4*i('C3')+5*i('G1')+5*i('G3')+5*i('T1')+5*i('T3')...
	+10*w('C1')+10*w('C3')+11*w('G1')+11*w('G3')+12*w('T1')+12*w('T3')...
	+26*h('C1')+26*h('C3')+24*h('G1')+24*h('G3')+27*s('T1')+27*h('T3')...
	+178*v('C1')+178*v('C3')+175*v('G1')+175*v('G3')+180*v('T1')+180*v('T3')...
	+228*x('C1')+228*x('C3')+220*x('G1')+220*x('G3')+240*x('T1')+240*x('T3')...
	+350*y('C1')+350*y('C3')+360*y('G1')+360*y('G3')+370*y('T1')+370*y('T3')...
	+420*z('C1')+420*z('C3')+435*z('G1')+435*z('G3')+450*z('T1')+450*z('T3'))...
	%End Per 1 Cost start Per 2 cost
	-1.12*(6*s('C2')+5*s('G2')+7*s('T2')...
	+19*g('C2')+18*g('G2')+20*g('T2')...
	+4*i('C2')+5*i('G2')+5*i('T2')...
	+10*w('C2')+11*w('G2')+12*w('T2')...
	+26*h('C2')+24*h('G2')+27*h('T2')...
	+178*v('C2')+175*v('G2')+180*v('T2')...
	+228*x('C2')+220*x('G2')+240*x('T2')...
	+350*y('C2')+360*y('G2')+370*y('T2')...
	+420*z('C2')+435*z('G2')+450*z('T2'))...
	%End Per 2 cost start carryover inventory cost for *3 items
	-0.08*(6*s('C3')+5*s('G3')+7*s('T3')...
	+19*g('C3')+18*g('G3')+20*g('T3')...
	+4*i('C3')+5*i('G3')+5*i('T3')...
	+10*w('C3')+11*w('G3')+12*w('T3')...
	+26*h('C3')+24*h('G3')+27*h('T3')...
	+178*v('C3')+175*v('G3')+180*v('T3')...
	+228*x('C3')+220*x('G3')+240*x('T3')...
	+350*y('C3')+360*y('G3')+370*y('T3')...
	+420*z('C3')+435*z('G3')+450*z('T3'));


	
%Initialize all constraints

%Chandler Period 1 Labor
prob.Constraints.cons1 = s('C1')+s('C3')+1.5*g('C1')+1.5*g('C3')+1.5*i('C1')+1.5*i('C3')+3*w('C1')+3*w('C3')+4*h('C1')+4*h('C3')...
	+(13*1+1.5*10+3*3)*v('C1')+(13*1+1.5*10+3*3)*v('C3')+(13*1+1.5*10+3*4)*x('C1')+(13*1+1.5*10+3*4)*x('C3')...
	+(13*1.5+1.5*10+3*3)*y('C1')+(13*1.5+1.5*10+3*3)*y('C3')+(13*1.5+1.5*10+3*4)*z('C1')+(13*1.5+1.5*10+3*4)*v('C3') <= 12000;
%Chandler Period 2 Labor
prob.Constraints.cons2 = s('C2')+1.5*g('C2')+1.5*i('C2')+3*w('C2')+4*h('C2')...
	+(13*1+1.5*10+3*3)*v('C2')+(13*1+1.5*10+3*4)*x('C2')...
	+(13*1.5+1.5*10+3*3)*y('C2')+(13*1.5+1.5*10+3*4)*z('C2') <= 12000;

%Glendale Period 1 Labor
prob.Constraints.cons3 = 3.5*s('G1')+3.5*s('G3')+3.5*g('G1')+3.5*g('G3')+4.5*i('G1')+4.5*i('G3')+4.5*w('G1')+4.5*w('G3')+5*h('G1')+5*h('G3')...
	+(13*3.5+4.5*10+4.5*3)*v('G1')+(13*3.5+4.5*10+4.5*3)*v('G3')+(13*3.5+4.5*10+3*5)*x('G1')+(13*3.5+4.5*10+3*5)*x('G3')...
	+(13*3.5+4.5*10+4.5*3)*y('G1')+(13*3.5+4.5*10+4.5*3)*y('G3')+(13*3.5+4.5*10+3*5)*z('G1')+(13*3.5+4.5*10+3*5)*v('G3') <= 15000;
	
%Glendale Period 2 Labor
prob.Constraints.cons4 = 3.5*s('G2')+3.5*g('G2')+4.5*i('G2')+4.5*w('G2')+5*h('G2')...
	+(13*3.5+4.5*10+4.5*3)*v('G2')+(13*3.5+4.5*10+3*5)*x('G2')...
	+(13*3.5+4.5*10+4.5*3)*y('G2')+(13*3.5+4.5*10+3*5)*z('G2') <= 15000;

%Tucson Period 1 Labor
prob.Constraints.cons5 = 3*s('T1')+3*s('T3')+3.5*g('T1')+3.5*g('T3')+4*i('T1')+4*i('T3')+4.5*w('T1')+4.5*w('T3')+5.5*h('T1')+5.5*h('T3')...
	+(13*3+4*10+4.5*3)*v('T1')+(13*3+4*10+4.5*3)*v('T3')+(13*3+4*10+5.5*3)*x('T1')+(13*3+4*10+5.5*3)*x('T3')...
	+(13*3.5+4*10+4.5*3)*y('T1')+(13*3.5+4*10+4.5*3)*y('T3')+(13*3.5+4*10+5.5*3)*z('T1')+(13*3.5+4*10+5.5*3)*v('T3') <= 22000;
	
% Tucson Period 2 Labor
prob.Constraints.cons6 = 3*s('T2')+3.5*g('T2')+4*i('T2')+4.5*w('T2')+5.5*h('T2')...
	+(13*3+4*10+4.5*3)*v('T2')+(13*3+4*10+5.5*3)*x('T2')...
	+(13*3.5+4*10+4.5*3)*y('T2')+(13*3.5+4*10+5.5*3)*z('T2') <= 22000;

%Chandler Period 1 Packing
prob.Constraints.cons7 = 4*s('C1')+4*s('C3')+4*g('C1')+4*g('C3')+5*i('C1')+5*i('C3')+6*w('C1')+6*w('C3')+6*h('C1')+6*h('C3')...
	+(13*4+5*10+6*3)*v('C1')+(13*4+5*10+6*3)*v('C3')+(13*4+5*10+6*3)*x('C1')+(13*4+5*10+6*3)*x('C3')...
	+(13*4+5*10+6*3)*y('C1')+(13*4+5*10+6*3)*y('C3')+(13*4+5*10+6*3)*z('C1')+(13*4+5*10+6*3)*v('C3') <= 20000;

%Chandler Period 2 Packing
prob.Constraints.cons8 = 4*s('C2')+4*g('C2')+5*i('C2')+6*w('C2')+6*h('C2')...
	+(13*4+5*10+6*3)*v('C2')+(13*4+5*10+6*3)*x('C2')...
	+(13*4+5*10+6*3)*y('C2')+(13*4+5*10+6*3)*z('C2') <= 20000;

%Glendale Period 1 Packing
prob.Constraints.cons9 = 7*s('G1')+7*s('G3')+7*g('G1')+7*g('G3')+8*i('G1')+8*i('G3')+9*w('G1')+9*w('G3')+7*h('G1')+7*h('G3')...
	+(13*7+8*10+9*3)*v('G1')+(13*7+8*10+9*3)*v('G3')+(13*7+8*10+7*3)*x('G1')+(13*7+8*10+7*3)*x('G3')...
	+(13*7+8*10+9*3)*y('G1')+(13*7+8*10+9*3)*y('G3')+(13*7+8*10+7*3)*z('G1')+(13*7+8*10+7*3)*v('G3') <= 40000;

%Glendale Period 2 Packing
prob.Constraints.cons10 = 7*s('G2')+7*g('G2')+8*i('G2')+9*w('G2')+7*h('G2')...
	+(13*7+8*10+9*3)*v('G2')+(13*7+8*10+7*3)*x('G2')...
	+(13*7+8*10+9*3)*y('G2')+(13*7+8*10+7*3)*z('G2') <= 40000;

%Tucson Period 1 Packing
prob.Constraints.cons11 = 7.5*s('T1')+7.5*s('T3')+7.5*g('T1')+7.5*g('T3')+8.5*i('T1')+8.5*i('T3')+9.5*w('T1')+9.5*w('T3')+8*h('T1')+8*h('T3')...
	+(13*7.5+8.5*10+9.5*3)*v('T1')+(13*7.5+8.5*10+9.5*3)*v('T3')+(13*7.5+8.5*10+8*3)*x('T1')+(13*7.5+8.5*10+8*3)*x('T3')...
	+(13*7.5+8.5*10+9.5*3)*y('T1')+(13*7.5+8.5*10+9.5*3)*y('T3')+(13*7.5+8.5*10+8*3)*z('T1')+(13*7.5+8.5*10+8*3)*v('T3') <= 35000;

%Tucson Period 3 Packing
prob.Constraints.cons12 = 7.5*s('T2')+7.5*g('T2')+8.5*i('T2')+9.5*w('T2')+8*h('T2')...
	+(13*7.5+8.5*10+9.5*3)*v('T2')+(13*7.5+8.5*10+8*3)*x('T2')...
	+(13*7.5+8.5*10+9.5*3)*y('T2')+(13*7.5+8.5*10+8*3)*z('T2') <= 35000;

%Period 1 Advertising
prob.Constraints.cons13 = s('C1')+s('C3')+1.5*g('C1')+1.5*g('C3')+1.1*i('C1')+1.1*i('C3')+1.5*w('C1')+1.5*w('C3')+1.9*h('C1')+1.9*h('C3')...
	+1.1*s('G1')+1.1*s('G3')+1.1*g('G1')+1.1*g('G3')+1.1*i('G1')+1.1*i('G3')+1.2*w('G1')+1.2*w('G3')+1.9*h('G1')+1.9*h('G3')...
	+1.3*s('T1')+1.3*s('T3')+1.3*g('T1')+1.3*g('T3')+1.3*i('T1')+1.3*i('T3')+1.3*w('T1')+1.3*w('T3')+1.9*h('T1')+1.9*h('T3') <= 20000;

%Period 2 Advertising
prob.Constraints.cons14 = s('C2')+1.5*g('C2')+1.1*i('C2')+1.5*w('C2')+1.9*h('C2')...
	+1.1*s('G2')+1.1*g('G2')+1.1*i('G2')+1.2*w('G2')+1.9*h('G2')...
	+1.3*s('T2')+1.3*g('T2')+1.3*i('T2')+1.3*w('T2')+1.9*h('T2') <= 20000;

%Period 1 Graphite
prob.Constraints.cons15 = 0.25*(g('C1')+g('C3')+g('G1')+g('G3')+g('T1')+g('T3'))+3.25*(y('C1')+y('C3')+z('C1')+z('C3')...
	+y('G1')+y('G3')+z('G1')+z('G3')+y('T1')+y('T3')+z('T1')+z('T3')) + e == 1000;

%Period 2 Graphite
prob.Constraints.cons16 = 0.25*(g('C1')+g('G2')+g('T2'))+3.25*(y('C2')+z('C2')...
	+y('G2')+z('G2')+y('T2')+z('T2')) <= (1000+e);

%Chandler Period 2 Sales Bounds
prob.Constraints.cons17 = s('C2')+s('C3') <= 3000;
prob.Constraints.cons18 = g('C2')+g('C3') <= 3000;
prob.Constraints.cons19 = g('C2')+g('C3') >= 100;
prob.Constraints.cons20 = i('C2')+i('C3') <= 3000;
prob.Constraints.cons21 = i('C2')+i('C3') >= 200;
prob.Constraints.cons22 = w('C2')+w('C3') <= 3000;
prob.Constraints.cons23 = w('C2')+w('C3') >= 30;
prob.Constraints.cons24 = h('C2')+h('C3') <= 3000;
prob.Constraints.cons25 = h('C2')+h('C3') >= 100;
prob.Constraints.cons26 = v('C2')+v('C3') <= 300;
prob.Constraints.cons27 = x('C2')+x('C3') <= 150;
prob.Constraints.cons28 = y('C2')+y('C3') <= 450;
prob.Constraints.cons29 = z('C2')+z('C3') <= 600;

%Glendale Period 2 Sales Bounds
prob.Constraints.cons30 = s('G2')+s('G3') <= 3000;
prob.Constraints.cons31 = g('G2')+g('G3') <=3000;
prob.Constraints.cons32 = g('G2')+g('G3') >= 100;
prob.Constraints.cons33 = i('G2')+i('G3') <= 3000;
prob.Constraints.cons34 = i('G2')+i('G3') >= 200;
prob.Constraints.cons35 = w('G2')+w('G3') <= 3000;
prob.Constraints.cons36 = w('G2')+w('G3') >= 30;
prob.Constraints.cons37 = h('G2')+h('G3') <= 3000;
prob.Constraints.cons38 = h('G2')+h('G3') >= 100;
prob.Constraints.cons39 = v('G2')+v('G3') <= 300;
prob.Constraints.cons40 = x('G2')+x('G3') <= 150;
prob.Constraints.cons41 = y('G2')+y('G3') <= 450;
prob.Constraints.cons42 = z('G2')+z('G3') <= 600;

%Tucson Period 2 Sales Bounds
prob.Constraints.cons43 = s('T2')+s('T3') <= 3000;
prob.Constraints.cons44 = g('T2')+g('T3') <= 3000;
prob.Constraints.cons45 = g('T2')+g('T3') >= 50;
prob.Constraints.cons46 = i('T2')+i('T3') <= 3000;
prob.Constraints.cons47 = i('T2')+i('T3') >= 100;
prob.Constraints.cons48 = w('T2')+w('T3') <= 3000;
prob.Constraints.cons49 = w('T2')+w('T3') >= 15;
prob.Constraints.cons50 = h('T2')+h('T3') <= 3000;
prob.Constraints.cons51 = h('T2')+h('T3') >= 100;
prob.Constraints.cons52 = v('T2')+v('T3') <= 300;
prob.Constraints.cons53 = x('T2')+x('T3') <= 150;
prob.Constraints.cons54 = y('T2')+y('T3') <= 450;
prob.Constraints.cons55 = z('T2')+z('T3') <= 600;

%Chandler Period 1 Set Assembly
prob.Constraints.cons56 = 65*(v('C1')+v('C3')+x('C1')+x('C3')+y('C1')+y('C3')+z('C1')+z('C3')) <= 5500;

%Chandler Period 2 Set Assembly
prob.Constraints.cons57 = 65*(v('C2')+x('C2')+y('C2')+z('C2')) <= 5500;

%Glendale Period 1 Set Assembly
prob.Constraints.cons58 = 60*(v('G1')+v('G3')+x('G1')+x('G3')+y('G1')+y('G3')+z('G1')+z('G3')) <= 5000;

%Glendale Period 2 Set Assembly
prob.Constraints.cons59 = 60*(v('G2')+x('G2')+y('G2')+z('G2')) <= 5000;

%Tucson Period 1 Set Assembly
prob.Constraints.cons60 = 65*(v('T1')+v('T3')+x('T1')+x('T3')+y('T1')+y('T3')+z('T1')+z('T3')) <= 6000;

%Tucson Period 1 Set Assembly
prob.Constraints.cons61 = 65*(v('T2')+x('T2')+y('T2')+z('T2')) <= 6000;


[sol,fval] = solve(prob);
toc;