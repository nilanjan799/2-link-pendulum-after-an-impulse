function [w1, w2]=impulse_calc(m1,m2,I1,I2,f,l)
%%% calculates the angular velocities of the links immediately after the
%%% impulse 
%%% impulse is horizontal and applied at the bottommost point of the vertical system
%%% this code will be updated with a more general case of an impulse at any
%%% point of the system at any orientation

A1= I1 + m1*l^2/4 + 3*m2*l^2/2;
A2=m2*l^2/2;
B1=I2 + 3*m2*l^2/4;
B2=I2 + m2*l^2/4;
M=[A1 B1;A2 B2];
C=[2*f*l;f*l];
X=M\C;
w1=X(1);
w2=X(2);

end