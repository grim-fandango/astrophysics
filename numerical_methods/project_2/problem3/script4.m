clear; clf;
out=load('outf'); % load the data file out 
t =out(:,1); % time 
xp=out(:,2); % the position of the primary star
yp=out(:,3);
xs=out(:,4); % the position of the secondary star
ys=out(:,5); 
Ep=out(:,6); % the energy of the primary star
Es=out(:,7); % the energy of the secondary star

% plot (a)
plot(xp,yp,'b');
hold on;
plot(xs,ys,'r');

xlabel('x', 'fontsize', 12);
ylabel('y', 'fontsize', 12);
set(gca, 'fontsize', 12);

plot(0,0,'*');
text(10,0,'BH');

legend({'Primary Star','Secondary Star'},'Location','Northwest');
hold off;

% plot (b)
figure(2);
plot(xs-xp, ys-yp,'g');

xlabel('x', 'fontsize', 12);
ylabel('y', 'fontsize', 12);
set(gca, 'fontsize', 12);

hold on;
plot(0,0,'*');
text(0.04,0,'Primary star');
hold off;

% plot (c)
figure(3);

plot(t,Ep);
hold on;
plot(t,Es);

legend('Primary Star','Secondary Star');
xlabel('t', 'fontsize', 12);
ylabel('Energy', 'fontsize', 12);
set(gca, 'fontsize', 12);
hold off;

% calculate velocities

ms = 0.8;
mp = 3.2;
Eplast = Ep(length(Ep));
Eslast = Es(length(Es));

Gm2a = 8.666e41;

vp = sqrt(2 * Eplast * Gm2a / (mp * 1.988e30))
vs = sqrt(2 * Eslast * Gm2a / (ms * 1.988e30))

vp
vs




