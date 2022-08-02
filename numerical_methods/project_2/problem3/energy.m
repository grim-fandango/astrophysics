function [Ep,Es]=energy(x,mb,mp,ms) 
% the energies of the two stars 
% input variables: x, mb, mp, ms. x is a vector variable. 
% out variables: Ep, Es
rp  = sqrt(x(1)^2+x(2)^2);     % BH-primary separation
vp2 =      x(3)^2+x(4)^2 ;     % squre of primary velocity  
rs  = sqrt(x(5)^2+x(6)^2);     % BH-secondary 
vs2 =      x(7)^2+x(8)^2 ;     % squre of secondary velocity  
rps = sqrt((x(5)-x(1))^2+(x(6)-x(2))^2);  % primary-secondary
Ep  = (mp/2)*vp2-mb*mp/rp-mp*ms/rps;      % primary energy
Es  = (ms/2)*vs2-mb*ms/rs-mp*ms/rps;      % secondary energy
