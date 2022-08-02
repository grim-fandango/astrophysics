% plot the orbits of the two stars
clear; clf;
load out     % load the data file out
xp=out(:,2); % the primary star
yp=out(:,3);
xs=out(:,4); % the secondary star 
ys=out(:,5);

plot(xp,yp) % plot the orbit of the primary star
hold on     % hold ON holds the current plot and all axis properties 
            % so that subsequent graphing commands add to the existing 
            % graph without resetting the color and linestyle.
plot(xs,ys,'r:') % plot the orbit of the secondary star
xlabel('x','FontSize',20)
ylabel('y','FontSize',20)
ylim([-0.8 0.8]) % plotting range from x=-0.8 to 0.8. 
set(gca, 'Fontsize', 20)
axis equal
