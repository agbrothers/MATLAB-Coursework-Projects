% Splitting and Averaging

% Clean up the matlab workspace
clc; clear all; close all;

% Provide the initial x and y coordinates in the form of vectors
x = [0, 0, 1, 1];
y = [0, 1, 1, 0];
xa = x;
ya = y;
numIterations = 1;

% Define the weighted coefficients for use in the averaging function
w = [1,2,1];
displacement = 1;

while displacement >= 10^-3 && numIterations < 15
    % Perform function calls until the displacement is insignificant
    xs = splitPts(xa);
    xa = averagePts(xs, w);
    
    ys = splitPts(ya);
    ya = averagePts(ys, w);
    
    
    % Check the significance of the averaging
    dx = xa - xs;
    dy = ya - ys;
    displacement = max(sqrt((dx.^2) + (dy.^2)));
    
    numIterations = numIterations + 1;
end

plot(x, y, '.', xa, ya, '.', 'MarkerSize', 12);
xlabel('X-Axis');
ylabel('Y-Axis');
title('Splitting and Averaging Functions');
legend('Initial Points', 'Smoothed Points');

    
    