function [ke,pe]=energy(m1,m2,I1,I2,w1,w2,l,th1,th2)

i = [1 0 0]; j = [0 1 0]; k = [0 0 1];
r1 = sin(th1)*i-cos(th1)*j;
r2 = sin(th2)*i-cos(th2)*j;
r_o_g1 = (l/2)*r1;
r_o_e = l*r1;
r_e_g2 = (l/2)*r2;
om1=w1*k; om2=w2*k;
vbar1=cross(om1,r_o_g1);
vbar2=cross(om1,r_o_e)+cross(om2,r_e_g2);
v1=sqrt(vbar1(1)^2 + vbar1(2)^2);
v2=sqrt(vbar2(1)^2 + vbar2(2)^2);
ke=.5*I1*w1^2 + .5*m1*v1^2 + .5*I2*w2^2 + .5*m2*v2^2;
pe=9.8*l*(-m1*.5*cos(th1) - m2*cos(th1) - m2*.5*cos(th2));
end
