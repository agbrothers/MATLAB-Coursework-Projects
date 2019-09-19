% This script approximates the solution curve to a differential equation
% using Runge-Kutta.  The differential equation being targeted gives the 
% decay of carbon-15.  The goal is to find the significance of the error 
% for each approximation method over three different time steps.  

clear all;  clc;  close all;

% 1) Set the time-stepping parameters
tFinal = 15;
dt = [1, 0.1, 0.01];

% (Final Step)
% Print the Results Header and Loop through the entire process for each time step (dt)
fprintf('  dt        RK1       RK2       RK4\n');

for j = 1:3
    
    % 2) Initialize the time array (for plotting things later)
    n = ceil(tFinal/dt(j)) + 1;
    time = linspace(0, tFinal, n);
    
    % 3) Initialize the arrays to hold the y-values for each method
    yM1 = zeros(1, n);
    yM2 = zeros(1, n);
    yM4 = zeros(1, n);
    yActual = zeros(1,n);
    
    % 4) Define the initial value conditions
    yM1(1)  = 1;
    yM2(1)  = 1;
    yM4(1)  = 1;
    yActual(1) = 1;
    
    % 5) Start a loop to simulate the radioactive decay with dt(j) = 1
    for k = 1:n - 1
        yM1(k+1) = advanceRK(yM1(k), dt(j), 1);
        yM2(k+1) = advanceRK(yM2(k), dt(j), 2);
        yM4(k+1) = advanceRK(yM4(k), dt(j), 4);
        yActual(k+1) = yActual(1) * exp(-log(2)* time(k+1)/2.45);
    end
    
    
    % 6) Calculate & print the average error for each approximation method
    error1 = mean(abs(yM1 - yActual));
    error2 = mean(abs(yM2 - yActual));
    error4 = mean(abs(yM4 - yActual));
    
    fprintf('%.2f:  %.2e  %.2e  %.2e\n', dt(j), error1, error2, error4);
    
    
    % 7) Plot the results
    figure;
    plot(time, yM1, time, yM2, time, yM4, time, yActual, 'linewidth', 1);
    xlabel('Time (s)');
    title('Methods of Approximating Radioactive Decay of Carbon 15');
    legend('RK1', 'RK2', 'RK4', 'Actual Solution');
    
end