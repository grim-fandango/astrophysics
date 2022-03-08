clear; clf
h = 0.2;        % time-step
t = 0;          % initial time
tf= 20;         % final time
X(1)= 1;      % initial position
X(2)= 0;      % initial velocity 
N = tf/h;       % number of time-steps
Xr = X;         % initial position for RK4
lastXr=0;
Xe = X;         % initial position for Euler
lastXe=0;
Xa = X;         % initial position for analytical solution
lastXa=0;

for j=1:N+1
     time(j)= t;
     E(:,j) = Xe;
     Ve(:,j) = Xe-lastXe/h;
     lastXe = Xe;
     R(:,j) = Xr;
     Vr(:,j) = Xr-lastXr/h;
     lastXr = Xr;
     A(:,j) = Xa;
     Va(:,j) = Xa-lastXa/h;
     lastXa = Xa;
     Xe = Eul(h,t,Xe);
     Xr = RK4(h,t,Xr);
     Xa = Ana(h,t,Xa);
     
     t  = t+h;
end

figure(1)
plot(time,E(1,:),'b')
hold on
plot(time,R(1,:),'r')
hold on
plot(time,A(1,:),'g')

xlabel('t','FontSize',20)
ylabel('x','FontSize',20)
set(gca, 'Fontsize', 15)

figure(2)
plot(E(1,:),Ve(1,:),'b')
hold on
plot(R(1,:),Vr(1,:),'r')
hold on
plot(A(1,:),Va(1,:),'g')

xlabel('x','FontSize',20)
ylabel('v','FontSize',20)
set(gca, 'Fontsize', 15)

