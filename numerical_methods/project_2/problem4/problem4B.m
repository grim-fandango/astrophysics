% problem4B.m
% Time evolution of temperature distribution u: spherical system
% Define A, B, C, unew(1) and unew(N)

% When you write code, it is a good practice to add comments that 
% describe the code. Comments allow others to understand your code, 
% and can refresh your memory when you return to it later. 
% Add comments to Octave code using the percent (%) symbol.
% Comment lines can appear anywhere in a program file, and you can 
% append comments to the end of a line of code. see section 26, Octave tutorial

mu    = 0.2;       % mu=dt/dx^2
N     = 50;        % grid points
steps = 2000;      % total time-steps
u     = ones(N,1); % initial condition: u = 1 anywhere
u(N)  = 0;         % boundary condition at the surface
approx=[];         % empty array
for n=1:steps      % time evolution     
    approx(:,n)=u; % Distribution u at each step saved in matrix: approx
                   % see section 5, Octave tutorial for the colon. 
                   % Add a new column to approx matrix in each timestep.
                   % k-th column of approx gives u at timestep k.
    for j=2:N-1
        A = ???;   % see Eq (46) and define A, B, C
        B = ???;
        C = ???;
        unew(j)= A*u(j-1)+B*u(j)+C*u(j+1);
    end      
    unew(1) = ???; % boundary condition at the centre
    unew(N) = ???; % boundary condition at the surface
    u = unew;      % update the distribution
end
u1 = approx(1,:);      % time evolution of temperature at the center j=1
nc = min(find(u1<0.5)) % critical timestep: central temp becomes < 0.5. 

x=linspace(0,1,N);     % generate N points between 0 and 1. 
plot(x,approx(:,[1:100:steps])) % plot temperture distributions
                                % distributions at n=1, 101, 201, 301...
                                % see section 5 and 6, Octave tutorial 
xlabel('x','FontSize',20)
ylabel('u','FontSize',20)
