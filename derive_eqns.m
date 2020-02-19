syms th1 th2 l w1 w2 b1 b2 g m1 m2 I1 I2
%%%%%% derives the equations of motion of the system  %%%%%%%

%%% coordinate axes
i = [1 0 0]; j = [0 1 0]; k = [0 0 1];

%%% unit radial vectors
r1 = sin(th1)*i-cos(th1)*j;
r2 = sin(th2)*i-cos(th2)*j;

%%% position vectors
r_o_g1 = (l/2)*r1;
r_o_e = l*r1;
r_e_g2 = (l/2)*r2;
r_o_g2 = r_o_e + r_e_g2;

%%% angular velocities and angular accelerations
om1 = w1*k; om2 = w2*k;
al1 = b1*k; al2 = b2*k;

%%% accelerations of the links 
ao = 0;
a1 = ao + cross(al1,r_o_g1) + cross(om1,cross(om1,r_o_g1));
ae = ao + cross(al1,r_o_e) + cross(om1,cross(om1,r_o_e));
a2 = ae + cross(al2,r_e_g2) + cross(om2,cross(om2,r_e_g2));

%%% moment equations
Mo = cross(r_o_g1,-m1*g*j) + cross(r_o_g2,-m2*g*j);
Me = cross(r_e_g2,-m2*g*j);
Hdot1 = I1*al1 + I2*al2 + cross(r_o_g1,m1*a1) + cross(r_o_g2,m2*a2);
Hdot2 = I2*al2 + cross(r_e_g2,m2*a2);

%%% solving for angular accelerations
hdot1=collect(Hdot1(3),[b1 b2]);
hdot2=collect(Hdot2(3),[b1 b2]);
mo=simplify(Mo(3));
me=simplify(Me(3));

%%% creating the form [M][alpha]=[c]
C1=simplify(subs(mo - hdot1,[b1 b2],[0 0]));
C2=simplify(subs(me - hdot2,[b1 b2],[0 0]));
A1=simplify(subs(hdot1-mo+C1,[b1 b2],[1 0]));
A2=simplify(subs(hdot2-me+C2,[b1 b2],[1 0]));
B1=simplify(subs(hdot1-mo+C1,[b1 b2],[0 1]));
B2=simplify(subs(hdot2-me+C2,[b1 b2],[0 1]));



