function xout=RK4(h,t,x,mp,ms)
% Runge-Kutta method
% input variables: h,t,x,mp,ms 
% output variables: xout
% function f.m is used 
k1   = h*f(t,x,         mp,ms);
k2   = h*f(t+h/2,x+k1/2,mp,ms);
k3   = h*f(t+h/2,x+k2/2,mp,ms);
k4   = h*f(t+h,x+k3,    mp,ms);
xout = x+k1/6+k2/3+k3/3+k4/6;  