function Etot=energy(x,mp,ms)
% binary energy
% input variables: x, mp, ms 
% output variables: Eot
vp2 = x(3)^2+x(4)^2 ; % the square of the primary star velocity
vs2 = x(7)^2+x(8)^2 ; % the square of the secondary star velocity
r   = sqrt((x(5)-x(1))^2+(x(6)-x(2))^2); % binary separation
Etot= (mp/2)*vp2+(ms/2)*vs2-mp*ms/r; % binary energy: kinetic + potential