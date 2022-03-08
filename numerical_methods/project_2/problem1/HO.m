clear; clf
h = 0.2;        % time-step
t = 0;          % initial time
tf= 20;         % final time
X(1)= 1;      % initial position
X(2)= 0;      % initial velocity 
N = tf/h;       % number of time-steps
Xr = X;         % initial position for RK4
Xe = X;         % initial position for Euler
Xa = X;         % initial position for analytical solution

for j=1:N+1
     time(j)= t;
     E(:,j) = Xe;
     R(:,j) = Xr;
     A(:,j) = Xa;
     Xe = Eul(h,t,Xe);
     Xr = RK4(h,t,Xr);
     Xa = Ana(h,t,Xa);
     t  = t+h;
end
plot(time,E(1,:))
hold on
plot(time,R(1,:),'r')
hold on
plot(time,A(1,:),'g')


xlabel('t','FontSize',20)
ylabel('x','FontSize',20)
set(gca, 'Fontsize', 15)