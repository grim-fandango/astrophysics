function xout=RK4(h,t,x,mb,mp,ms) 
% Runge-Kutta method
% input variables: h,t,x,mb,mp,ms 
% output variables: xout
% a new input variable mb is added. 
k1   = h*f(t,x,         mb,mp,ms);
k2   = h*f(t+h/2,x+k1/2,mb,mp,ms);
k3   = h*f(t+h/2,x+k2/2,mb,mp,ms);
k4   = h*f(t+h,x+k3,    mb,mp,ms);
xout = x+k1/6+k2/3+k3/3+k4/6;  
