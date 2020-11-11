function []=simulate_1()

%%%%%%% parameters %%%%%%
m1=5;
m2=5;
l=1;

% inertias taken about respective coms
I1=m1*l^2/12;
I2=m2*l^2/12;

g=9.8;
f=20;

%%%initial position of the links
th1i=0; th2i=0; 

%%% angular velocities of the links immediately after the impulse
[w1i, w2i]=impulse_calc(m1,m2,I1,I2,f,l);

%%% initial state
z0=[th1i;th2i;w1i;w2i];

options=odeset('RelTol',1e-8,'AbsTol',1e-8);  %%tolerance limits
to=0; tf=10; fps=50;
tspan=linspace(to,tf,tf*fps);

%%% ODE solver
[t,z]=ode45(@(t,z)solver(t,z,m1,m2,I1,I2,l,g),tspan,z0,options);

%%% animating
for i=1:length(tspan)
    pause(.005)
    Xe=l*sin(z(i,1));
    Ye=-l*cos(z(i,1));
    Xf=Xe+l*sin(z(i,2));
    Yf=Ye-l*cos(z(i,2));
    [ke,pe]=energy(m1,m2,I1,I2,z(i,3),z(i,4),l,z(i,1),z(i,2));
    te(i)=(ke+pe);
    subplot(2,1,1);
    plot(0,0,'k.','markersize',25)
    hold on
    plot([0,Xe],[0,Ye],'r','linewidth',4)
    plot([Xe,Xf],[Ye,Yf],'k','linewidth',4)
    axis([-2*l 2*l -2*l 2*l]);
    axis square
    hold off
end
  subplot(2,1,2);
  plot(tspan,te)

end
