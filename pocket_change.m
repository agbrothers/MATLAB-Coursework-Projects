% The Pocket Change Problem
% The purpose of this script is to calculate the number of coins recieved
% in all possible transactions and compute the average

% Clean up the Matlab Workspace
clear all;
clc;

% ////////////////////////////////////////////////////////////////////////
% /////////    Script
% ////////////////////////////////////////////////////////////////////////

% Define the values for each coin
quarter = 25;
dime = 10;
nickel = 5;
penny = 1;

% Define all global variables
totalCoins = 0;
iterations = 0;

% Loop through every possible amount of change
while iterations <= 99
    change = iterations;
    
    % Loop to determine the minimum number of coins required
    numCoins = 0;
    % fprintf('change = %.f', change);
    
    while change > 0
        if change >= quarter
            change = change - quarter;
        elseif change >= dime
            change = change - dime;
        elseif change >= nickel
            change = change - nickel;
        elseif change >= penny
            change = change - penny;
        end
        numCoins = numCoins + 1;
    end
    
    totalCoins = totalCoins + numCoins;
    iterations = iterations + 1;
    % fprintf('   numCoins = %.f\n',numCoins);
end

% Calculate the overall average number of coins per transaction
avgCoins = totalCoins / iterations;

% Print the result to the screen
fprintf('Average Number of Coins = %.2f\n',avgCoins)



