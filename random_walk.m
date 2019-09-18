% August 6, 2018
% /////////////////////////////////////////////////////////////////
% This script simulates a Random Walk, where each element of the
% array is a cell, and each cell traverses the array. Interactions
% determine whether cells live or die with each new generation
% The array has been mapped to a toroidal geometry.   

% Clean up the matlab workspace
clc; clear all; close all;

% Define the size of the matrix and number of generations
n = 150;   % col
m = 200;   % row
generations = 300;

A = zeros(n,m);

% Randomly assign living and dead cells to A with a 1:9 ratio
for j = 1:n
    for k = 1:m
        if rand < 0.1
            A(j,k) = 1;
        end
    end
end

% Display the image of the initial matrix
imagesc(A);
drawnow;

Anew = zeros(n,m);

% Loop through the predetermined number of generations
for i = 1:generations
    
    % Loop through each cell and identify the neighbors
    for j = 1:n
        
        for k = 1:m
            % Identify whether the current cell is dead or alive
            alive = A(j,k);
            
            % Initialize an array to store the neighbors of the current cell
            nb = zeros(3,3);
            
            % Define directions relative to the j and k values of the current cell
            north = j - 1;
            south = j + 1;
            west = k - 1;
            east = k + 1;
            
            % Check if the current cell is a boundary cell
            if north < 1
                north = n;
            end
            if south > n
                south = 1;
            end
            if east > m
                east = 1;
            end
            if west < 1
                west = m;
            end
            
            % Add the values of the neighbor cells to corresponding cells of nb
            nb(1,1) = A(north, west);
            nb(1,2) = A(north, k);
            nb(1,3) = A(north, east);
            nb(2,1) = A(j, west);
            nb(2,3) = A(j, east);
            nb(3,1) = A(south, west);
            nb(3,2) = A(south, k);
            nb(3,3) = A(south, east);
            
            % Sum up all the values of the neighbor matrix nb
            sumNeighbors = sum(sum(nb));
            
            % Determine if the current cell survives into the next generation
            if sumNeighbors == 3
                Anew(j,k) = 1;
            elseif sumNeighbors == 2 && alive == 1
                Anew(j,k) = 1;
            else
                Anew(j,k) = 0;
            end
        end
    end
    
    % Update A and draw the matrix for the new generation
    A = Anew;
    imagesc(A);
    drawnow;
end



