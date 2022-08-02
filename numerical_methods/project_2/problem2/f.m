function dxdt = f(t,x,mp,ms)
% The vector F. see equatiion 13
% input variables: t, x, mp, ms
% output variables: dxdt
  r = sqrt((x(1)-x(5))^2+(x(2)-x(6))^2);
  dxdt(1) = x(3);
  dxdt(2) = x(4);
  dxdt(3) = ms*(x(5)-x(1))/r^3;
  dxdt(4) = ms*(x(6)-x(2))/r^3;
  dxdt(5) = x(7);
  dxdt(6) = x(8);
  dxdt(7) = mp*(x(1)-x(5))/r^3;
  dxdt(8) = mp*(x(2)-x(6))/r^3;