% Nested Radicals
% The purpose of this script is to calculate a series involving nested
% radicals for a given input m

% Clean up the Matlab Workspace
clear all;
clc;

% ////////////////////////////////////////////////////////////////////////
% /////////    Script
% ////////////////////////////////////////////////////////////////////////

% Store whether the user has provided a valid input or not
validInput = 0;

% Prompt the user for input, and loop until the user provides a valid input
while validInput == 0
    m = input('Please enter an integer value (greater than 1) for m: ');
    if m <= 1 || mod(m,1) ~= 0
        fprintf('ERROR: ');
    else
        validInput = 1;
    end 
end

% Print m to the console
fprintf('m = %.f\n', m);

% Define initial values for tn-2, tn-1, and tn
tn_2 = sqrt(m);
tn_1 = sqrt(m - sqrt(m));
tn = sqrt(m - sqrt(m + tn_2));

% Find the absolute difference between tn and tn-1
tdif = abs(tn - tn_1);

% Create the iteration counter variable n
n = 3;

% Print initial values
fprintf('t1 = %.12f\n', tn_2);
fprintf('t2 = %.12f\n', tn_1);
fprintf('t%.f = %.12f\n', n, tn);


% The while loop breaks when the difference between t's is sufficiently small
while tdif > 1*10^(-12)
    n = n + 1;
    
    % Reassign values of t for new value of n
    tn_2 = tn_1;
    tn_1 = tn;
    tn = sqrt(m - sqrt(m + tn_2));
    
    % Print the new tn
    fprintf('t%.f = %.12f\n', n, tn);
    
    % Calculate the new difference between most recent terms
    tdif = abs(tn - tn_1);
      
end