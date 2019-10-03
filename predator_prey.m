% The Three Species Problem
% The purpose of this script is to observe the population of three competing species over time

% Clean up the Matlab Workspace
clear all;
clc;

% ////////////////////////////////////////////////////////////////////////
% /////////    Script
% ////////////////////////////////////////////////////////////////////////

% Start timer to track the speed of the script execution
tic;
tStart = tic;

% Define the Lotka-Volterra Coefficients
a = 0.75;
b =  1.5;
c =  0.5;
d =    1;
e = 0.75;
f = 1.25;
g =  1.5;
h =    1;
i =    1;

% Define the time stepping parameters
tFinal = 12;
dt = 0.001;

% Calculate the integer number of steps required
tSteps = ceil(tFinal/dt);

% Define the initial value conditions (x = prey, y = predator)
xOld = 2;
yOld = 2.49;
zOld = 1.5;

% Header for the Results
fprintf('Time      X      Y      Z\n', xOld);
fprintf('%4.1f  %5.2f  %5.2f  %5.2f \n', 0, xOld, yOld, zOld);

% Discretized variables assigned in loop
for k = 1:1:tSteps
 % Define the Lotka Volterra Equations for each increment of dt
 xNew = xOld + dt * (a*xOld*(1 - (xOld/20)) - b*xOld*yOld - c*xOld*zOld);
 yNew = yOld + dt * (d*yOld*(1 - (yOld/25)) - e*xOld*yOld - f*yOld*zOld);
 zNew = zOld + dt * (g*zOld*(1 - (zOld/30)) - h*xOld*zOld - i*yOld*zOld);
 
 % Update the values of x,y,z for the next iteration of the loop
 xOld = xNew;
 yOld = yNew;
 zOld = zNew;
 
 if mod(k, 500) == 0
     fprintf('%4.1f  %5.2f  %5.2f  %5.2f \n', k/1000, xNew, yNew, zNew);
 end

end

tElapsed = toc(tStart);




