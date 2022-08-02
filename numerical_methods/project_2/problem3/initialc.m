function [t, x] =  initialc(mb,mp,ms,Rf,phi)
% input valiables: D,mb,mp,ms. D=Rp/Rtidal is the penetration factor. 
% out variables: t and x. Note that x is a vector.  
% Define the initial values of t and x as functions of the input valiables.

Rtdl   = (mb^(1/3))
Rp     = Rf*Rtdl;

D = Rp/Rtdl;  % penetration factor: Rp/Rtidal

f     = -acos(-1+(D/5));

M      = 4e6;
m      = 4;

RpV(1) = ms * cos(phi + pi);
RpV(2) = ms * sin(phi + pi);

RsV(1) = mp * cos(phi);
RsV(1) = mp * sin(phi);

R      = 2*Rp/(1+cos(f));

Xcm(1) = R*cos(f);
Xcm(2) = R*sin(f);

rpV(1) = ms * cos(phi + pi);
rpV(2) = ms * sin(phi + pi);

rsV(1) = mp * cos(phi);
rsV(2) = mp * sin(phi);

xp     = Xcm + rpV;
xs     = Xcm + rsV;

% calculate velocities

drpdt(1) = -ms * sin(phi + pi)
drpdt(2) = ms * cos(phi + pi)

drsdt(1) = -mp * sin(phi)
drsdt(2) = mp * cos(phi)

Rdot   = ((M/m)^(1/3) / sqrt(2*D)) * sin(f);
fdot   = (sqrt(2)/4) * D^(-3/2) * (1 + cos(f))^2;

dXdt(1)   = (Rdot * cos(f)) - (R * fdot * sin(f));
dXdt(2)   = (Rdot * sin(f)) + (R * fdot * cos(f));

dxpdt = dXdt + drpdt;
dxsdt = dXdt + drsdt;



 
t     = sqrt(2)/3 * D^(3/2)*tan(f/2) * (3+(tan(f/2)^2)) ; % initial time
x(1)  = xp(1) ; % x : primary star
x(2)  = xp(2) ; % y
x(3)  = dxpdt(1); % dx/dt
x(4)  = dxpdt(2); % dy/dt
x(5)  = xs(1) ; % x : secondary star
x(6)  = xs(2) ; % y
x(7)  = dxsdt(1); % dx/dt
x(8)  = dxsdt(2); % dy/dt

