% problem4Ac.m
% First 1000 random numbers are generaged and stored in array X. 
% To produce a histogram, bin ediges are defined by the "binedges" array.
% The elements of the array are 0, 0.2, 0.4, 0.6 0.8 and 1, 
% these idicate the edges of the bins. 
% The "histc" function counts the number of the elements of X that fall 
% in the bins. The elements of "counts" give the number in each bin. 
% "midopoints" is the midpoints/cenetres of the bins. Note that dx is the 
% bin size. By using the tic and toc function, the time taken by the program 
% to execute can be measured. 

tic                 % Start a stopwatch timer.
clear               % clear variables and functions from memory
hold on;

out = load('2000walks');  % load the walks from other program
X = out(:,3);        %load column 3, distance from origin

dx = 0.05;           % bin size;

binedges = 0:dx:5;  % define evenly spaced array, start : step : end
                    % see section 6, Octave tutorial
                    % binedges = 0, 0.2, 0.4, 0.6, 0.8, 1
                    
histogram(X,binedges);% counts in each bin
                    % 0-0.2, 0.2-0.4, 0.4-0.6, 0.6-0.8, 0.8-1 and 1-1
                    % the last bin 1-1 is useless. 

midpoints = binedges+dx/2; % midpoints of the bins
                           % 0.1, 0.3, 0.5, 0.7, 0.9, 1.1
                           % the last point 1.1 is meaningless, but 
                           % when we plot the results by using plot below,
                           % the two vectors midpoints and counts should 
                           % have the same length, i.e. 6. so we include
                           % 1.1 in the midpoints. 

xlim([0 1])                 % plot-range from x=0 to 1. 
grid on                     % adds major grid lines to current axes.
xlabel('distance from origin','FontSize',10)
ylabel('Counts','FontSize',10)
set(gca, 'FontSize', 10)
toc         % Read the stopwatch timer.
            % tic and toc functions work together to measure elapsed time.
