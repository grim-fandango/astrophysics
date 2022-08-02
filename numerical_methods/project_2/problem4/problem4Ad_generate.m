% 4Ad - generates resultants from 1e5 random walks of 2000 steps

tic
clear        % clear variables and functions from memory

d = 0.01;    % distance

% initial conditions
x(1) = 0;    
y(1) = 0;
np = 1e5;

delete 1e5walks  % delete file so that old data are not kept

for j=1:np
  for i=2:2000  % Repeat statements a specific number of times,i.e. 100 times
               % see section 27.1, Octave tutorial
      theta = rand() * 2 * pi;
                          % pi: a built-in octave variable, 3.1415....
                          % semicolon suppresses output from octave command
                          % see section 17, Octave tutorial 
      x(i)  = x(i-1) + (d * cos(theta)); % define i-th element of x vector. sec 5, tutorial 
      y(i)  = y(i-1) + (d * sin(theta)); % define i-th element of y vector     
  end
  xFinal(j) = x(2000);
  yFinal(j) = y(2000);
  rFinal(j) = sqrt(x(2000)^2 + y(2000)^2);
  
  o = [xFinal(j) yFinal(j) rFinal(j)];  % generate data line to save
  save 1e5walks o -ascii -append       % save data line
  
end

toc