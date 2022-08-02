% this is the main code to estimate the binary evolution
% two functions: energy.m and RK4.m are used in this code.
% See section 24, Octave tutorial for Function m-files
% Define mp, ms, x(1)-x(8) and tmax 

clear;clf          
h      = 1.d-2;  % time-step size
Ns     = 100  ;  % sampling
%-----------------
mp    =  0.8 ;  % primary mass
ms    =  0.2 ;  % secondary mass
x(1)  =  -0.2 ;  % primary x
x(2)  =  0 ;  % primary y
x(3)  =  0 ;  % primary vx
x(4)  =  -0.2 ;  % primary vy
x(5)  =  0.8 ;  % secondary x
x(6)  =  0 ;  % secondary y
x(7)  =  0 ;  % secondary vx
x(8)  =  0.8 ;  % secondary vy
tmax  =  8*pi ;  % final time
%-----------------
t      =  0  ;  % initial time
tprint =  t;
dtp    =  (tmax-t)/Ns;
while t < tmax
     if  t >= tprint
         E = energy(x,mp,ms);       % Estimat binary energy
         v = [t x(1) x(2) x(5) x(6) E]; 
         save out v -ascii -append  % save the v vector in the file out           
         tprint =  tprint + dtp;
     end
     x = RK4(h,t,x,mp,ms); % Runge-Kutta method 
     t = t+h;
end
