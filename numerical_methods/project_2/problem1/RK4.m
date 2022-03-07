function Xout=RK4(h,t,X)
k1   = h*f(t,X);
k2   = h*f(t+h/2,X+k1/2);
k3   = h*f(t+h/2,X+k2/2);
k4   = h*f(t+h,X+k3);
Xout = X+k1/6+k2/3+k3/3+k4/6;  
