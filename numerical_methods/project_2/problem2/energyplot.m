% plot the evolution of the binary energy (it should be a constant). 
% Defin mp, ms, and tmax 
clear; clf;
%----------------
mp   = 0.8
ms   = 0.2
tmax = 6*pi
%----------------
load out  % load the data file out
t     = out(:,1); % time 
E     = out(:,6); % energy
exact = -mp*ms/2; % analytic estimate

plot(t,E,'o') % numerical energy
hold on 
plot([0 tmax],[exact exact],'r') % exact line
xlabel('t','FontSize',20)
ylabel('E','FontSize',20)
xlim([0 tmax])
ylim([-0.2 0])
set(gca, 'Fontsize', 20)
legend({'Numerical', 'Exact'},
'Location', 'northeast');
