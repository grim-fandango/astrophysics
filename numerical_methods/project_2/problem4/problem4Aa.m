% problem 4Aa

clear        % clear variables and functions from memory

d = 0.01;    % distance

% initial conditions
x(1) = 0;    
y(1) = 0;



for i=2:2000  % Repeat statements a specific number of times,i.e. 100 times
		   % see section 27.1, Octave tutorial
  theta = rand() * 2 * pi;
					  % pi: a built-in octave variable
					  % semicolon suppresses output 
					  % see section 17, Octave tutorial 
  x(i)  = x(i-1) + (d * cos(theta)); % define i-th element of x vector 
  y(i)  = y(i-1) + (d * sin(theta)); % define i-th element of y vector     
end

figure(1);
plot(x,y)  % plots vector Y versus vector X. see section 17
axis equal % sets the aspect ratio so that equal tick mark
           % increments on the x and y axis are equal in size.
xlabel('x','FontSize',20) % X-axis label
ylabel('y','FontSize',20) % Y-axis label
