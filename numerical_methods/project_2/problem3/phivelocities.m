clear;clf;
vp=[  2.6181e6 0,
    -2.258e6	 pi/4, 
    -2.108e6	 pi/2,
    -2.388e6	 3*pi/4,
    -2.623e6	 pi,
     2.260e6	 5*pi/4,
     2.096e6	 3*pi/2,
     2.378e6	 7*pi/4,
     2.618e6	 2*pi]
     
vs=[-5.2362e6  0,
     4.505e6   pi/4, 
     4.205e6   pi/2,
     4.766e6   3*pi/4,
     5.237e6   pi,
    -4.531e6   5*pi/4,
    -4.204e6   3*pi/2,
    -4.766e6   7*pi/4,
    -5.245e6   2*pi]

hold on;     
plot(vp(:,2),vp(:,1),'r')
plot(vs(:,2),vs(:,1),'b')

xlabel('initial binary phase (radian)', 'fontsize', 12);
ylabel('post-encounter velocity (ms^-1)', 'fontsize', 12);
set(gca, 'fontsize', 12);

legend('Primary star','Secondary star')