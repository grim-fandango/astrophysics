clear; clf;
h = 0.2;        % time-step
t = 0;          % initial time
tf= 20;         % final time
X(1)= 1;      % initial position
X(2)= 0;      % initial velocity 
N = tf/h;       % number of time-steps
Xr = X;         % initial position for RK4
Xe = X;         % initial position for Euler

for j=1:N+1
     time(j)= t;
     
     E(:,j) = Xe;
     Ve(:,j) = Xe(2)
     
     R(:,j) = Xr;
     Vr(:,j) = Xr(2)
     
     A(:,j) = cos(t); % exact solution is cos
     Va(:,j) = -sin(t); % d(cos t)/dt i.e. velocity = sin(t)
     
     Xe = Eul(h,t,Xe);
     Xr = RK4(h,t,Xr);
     
     t  = t+h;
end

figure(1);
plot(time,E(1,:),'b');
hold on;
plot(time,R(1,:),'r*');
hold on;
plot(time,cos(time),'g');
legend({'Euler method', '4th order Runge-Kutta method', 'Analytical solution'},
'Location', 'northwest');

xlabel('t','FontSize',20);
ylabel('x','FontSize',20);
set(gca, 'Fontsize', 15);
hold off;

figure(2);
plot(E(1,:),Ve(1,:),'b');
hold on;
plot(R(1,:),Vr(1,:),'r*');
hold on;
plot(A(1,:),Va(1,:),'g');
legend('Euler method', '4th order Runge-Kutta method', 'Analytical solution');

xlabel('x','FontSize',20);
ylabel('v','FontSize',20);
set(gca, 'Fontsize', 15);

