function dz=solver(t,z,m1,m2,I1,I2,l,g)

th1=z(1);
th2=z(2);
w1=z(3);
w2=z(4);
 
%%% elements of the matrix M & C of the form MX=C ( the expressions have been
%%% copied from from the outputs of the derive_eqns script
C1=-(l*(- l*m2*sin(th1 - th2)*w1^2 + l*m2*sin(th1 - th2)*w2^2 + g*m1*sin(th1) + 2*g*m2*sin(th1) + g*m2*sin(th2)))/2;
C2=-(l*m2*(- l*sin(th1 - th2)*w1^2 + g*sin(th2)))/2;
A1=I1 + (l^2*m1)/4 + l^2*m2 + (l^2*m2*cos(th1 - th2))/2;
A2=(l^2*m2*cos(th1 - th2))/2;
B1=I2 + (l^2*m2)/4 + (l^2*m2*cos(th1 - th2))/2;
B2=(m2*l^2)/4 + I2;

M=[A1 B1; A2 B2];
C=[C1; C2];
X = M \ C;
b1=X(1);
b2=X(2);
dz=[w1 w2 b1 b2]';
end

