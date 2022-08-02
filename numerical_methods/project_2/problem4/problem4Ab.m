% example 4Ab

clear        % clear variables and functions from memory

d = 0.01;    % distance

% initial conditions
x(1) = 0;    
y(1) = 0;


for j=1:2000
  for i=2:2000  % Repeat statements a specific number of times
               % see section 27.1, Octave tutorial
      theta = rand() * 2 * pi;
                          % pi: a built-in octave variable, 3.1415....
                          % semicolon suppresses output from octave command
                          % see section 17, Octave tutorial 
      x(i)  = x(i-1) + (d * cos(theta)); % define i-th element of x vector 
      y(i)  = y(i-1) + (d * sin(theta)); % define i-th element of y vector     
  end
  xFinal(j) = x(2000);
  yFinal(j) = y(2000);
  rFinal(j) = sqrt(x(2000)^2 + y(2000)^2);
end

plot(xFinal, yFinal, '.')

axis equal % sets the aspect ratio so that equal tick mark
           % increments on the x and y axis are equal in size.
xlabel('x') % X-axis label
ylabel('y') % Y-axis label
