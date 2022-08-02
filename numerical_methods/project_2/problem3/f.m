function dxdt = f(t,x,mb,mp,ms)
% a new input variabel mb has been added. 
% include the BH gravity terms. see eq 20. 
  r = sqrt((x(1)-x(5))^2+(x(2)-x(6))^2);
  rp = sqrt(x(1)^2+x(2)^2);
  rs = sqrt(x(5)^2+x(6)^2);
  
  dxdt(1) = x(3);
  dxdt(2) = x(4);
  dxdt(3) = ((mb/rp^3) * -x(1)) + ((ms/(r^3))*(x(5)-x(1)));
  dxdt(4) = ((mb/rp^3) * -x(2)) + ((ms/(r^3))*(x(6)-x(2)));
  dxdt(5) = x(7);
  dxdt(6) = x(8);
  dxdt(7) = ((mb/rs^3) * -x(5)) + ((mp/(r^3))*(x(1)-x(5)));
  dxdt(8) = ((mb/rs^3) * -x(6)) + ((mp/(r^3))*(x(2)-x(6)));
