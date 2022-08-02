% The disruption of a binary by a massive BH
% the main code
% define mb, mp, ms. These are dimensionless masses. 

clear             % clear all variables and functions from memory

h     = 1.d-3;    % time-step size
Ns    = 10000;    % sampling
mb    = 1e6 ;     % BH mass in units of the binary mass m (1e6)
mp    = 0.8 ;     % primary star mass in units of m (0.8)
ms    = 0.2 ;     % secondary star mass in units of m (0.2)
Rf    = 3;      % approach distance factor (3, then 0.1)
phi   = pi/2;    % binary phase (initially pi/2)

[t, x] = initialc(mb,mp,ms,Rf,phi); % Define the initial values of t and x. 

tmax   = -t;
tprint =  t;
dtp    =  (tmax-t)/Ns;

delete outf;
while t < tmax
     if  t >= tprint
        [Ep,Es] = energy(x,mb,mp,ms);
         v = [t x(1) x(2) x(5) x(6) Ep Es];
         save outf v -ascii -append              
         tprint =  tprint + dtp;
     end
     x = RK4(h,t,x,mb,mp,ms);
     t = t+h;
end
