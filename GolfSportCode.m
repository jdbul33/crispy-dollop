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


% set each product's minimal and maximal by plant only upper bounds for period 1

s('C1').UpperBound = 2000;
s('G1').UpperBound = 2000;
s('T1').UpperBound = 2000;

g('C1').LowerBound = 100;
g('G1').LowerBound = 100;
g('T1').LowerBound = 50;
g('C1').UpperBound = 2000;
g('G1').UpperBound = 2000;
g('T1').UpperBound = 2000;

i('C1').LowerBound = 200;
i('G1').LowerBound = 200;
i('T1').LowerBound = 100;
i('C1').UpperBound = 2000;
i('G1').UpperBound = 2000;
i('T1').UpperBound = 2000;

w('C1').LowerBound = 30;
w('G1').LowerBound = 30;
w('T1').LowerBound = 15;
w('C1').UpperBound = 2000;
w('G1').UpperBound = 2000;
w('T1').UpperBound = 2000;

h('C1').LowerBound = 100;
h('G1').LowerBound = 100;
h('T1').LowerBound = 100;
h('C1').UpperBound = 2000;
h('G1').UpperBound = 2000;
h('T1').UpperBound = 2000;

v('C1').UpperBound = 200;
v('G1').UpperBound = 200;
v('T1').UpperBound = 200;

x('C1').UpperBound = 100;
x('G1').UpperBound = 100;
x('T1').UpperBound = 100;

y('C1').UpperBound = 300;
y('G1').UpperBound = 300;
y('T1').UpperBound = 300;

z('C1').UpperBound = 400;
z('G1').UpperBound = 400;
z('T1').UpperBound = 400;

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
prob.Constraints.cons1 = s('C1')+s('C3')+1.5*g('C1')+1.5*g('C3')+1.5*i('C1')+1.5*i('C3')+3*w('C1')+1.5*w('C3')+4*h('C1')+4*h('C3')...
	+(13*1+1.5*10+3*3)*v('C1')+(13*1+1.5*10+3*3)*v('C3')+(13*1+1.5*10+3*4)*x('C1')+(13*1+1.5*10+3*4)*x('C3')...
	+(13*1.5+1.5*10+3*3)*y('C1')+(13*1.5+1.5*10+3*3)*y('C3')+(13*1.5+1.5*10+3*4)*z('C1')+(13*1.5+1.5*10+3*4)*v('C3') <= 12000;
%Chandler Period 2 Labor
prob.Constraints.cons2 = s('C2')+1.5*g('C2')+1.5*i('C2'))+3*w('C2')+4*h('C2')...
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
prob.Constraints.cons7 = ;

%Chandler Period 2 Packing
prob.Constraints.cons8 = ;

%Glendale Period 1 Packing
prob.Constraints.cons9 = ;

%Glendale Period 2 Packing
prob.Constraints.cons10 = ;

%Tucson Period 1 Packing
prob.Constraints.cons11 = ;

%Tucson Period 3 Packing
prob.Constraints.cons12 = ;

%Period 1 Advertising
prob.Constraints.cons13 = ;

%Period 2 Advertising
prob.Constraints.cons14 = ;

%Period 1 Graphite
prob.Constraints.cons15 = ;

%Period 2 Graphite
prob.Constraints.cons16 = ;

%Chandler Period 2 Sales Bounds
prob.Constraints.cons17 = s('C2')+s('C3') <= 2000;
prob.Constraints = g('C2')+g('C3') <= 2000;
prob.Constraints = g('C2')+g('C3') >= 100;
prob.Constraints = i('C2')+i('C3') <= 2000;
prob.Constraints = i('C2')+i('C3') >= 200;
prob.Constraints = w('C2')+w('C3') <= 2000;
prob.Constraints = w('C2')+w('C3') >= 30;
prob.Constraints = h('C2')+h('C3') <= 2000;
prob.Constraints = h('C2')+h('C3') >= 100;
prob.Constraints = v('C2')+v('C3') <= 200;
prob.Constraints = x('C2')+x('C3') <= 100;
prob.Constraints = y('C2')+y('C3') <= 300;
prob.Constraints = z('C2')+z('C3') <= 400;

%Glendale Period 2 Sales Bounds
prob.Constraints.cons18 = s('G2')+s('G3') <= 2000;
prob.Constraints = g('G2')+g('G3') <= 2000;
prob.Constraints = g('G2')+g('G3') >= 100;
prob.Constraints = i('G2')+i('G3') <= 2000;
prob.Constraints = i('G2')+i('G3') >= 200;
prob.Constraints = w('G2')+w('G3') <= 2000;
prob.Constraints = w('G2')+w('G3') >= 30;
prob.Constraints = h('G2')+h('G3') <= 2000;
prob.Constraints = h('G2')+h('G3') >= 100;
prob.Constraints = v('G2')+v('G3') <= 200;
prob.Constraints = x('G2')+x('G3') <= 100;
prob.Constraints = y('G2')+y('G3') <= 300;
prob.Constraints = z('G2')+z('G3') <= 400;

%Tucson Period 2 Sales Bounds
prob.Constraints.cons19 = s('T2')+s('T3') <= 2000;
prob.Constraints = g('T2')+g('T3') <= 2000;
prob.Constraints = g('T2')+g('T3') >= 50;
prob.Constraints = i('T2')+i('T3') <= 2000;
prob.Constraints = i('T2')+i('T3') >= 100;
prob.Constraints = w('T2')+w('T3') <= 2000;
prob.Constraints = w('T2')+w('T3') >= 15;
prob.Constraints = h('T2')+h('T3') <= 2000;
prob.Constraints = h('T2')+h('T3') >= 100;
prob.Constraints = v('T2')+v('T3') <= 200;
prob.Constraints = x('T2')+x('T3') <= 100;
prob.Constraints = y('T2')+y('T3') <= 300;
prob.Constraints = z('T2')+z('T3') <= 400;

%Chandler Period 1 Set Assembly
prob.Constraints.cons20 = ;

%Chandler Period 2 Set Assembly
prob.Constraints.cons21 = ;

%Glendale Period 1 Set Assembly
prob.Constraints.cons22 = ;

%Glendale Period 2 Set Assembly
prob.Constraints.cons23 = ;

%Tucson Period 1 Set Assembly
prob.Constraints.cons24 = ;

%Tucson Period 1 Set Assembly
prob.Constraints.cons25 = ;


















[sol,fval] = solve(prob)