% August 6, 2018
% //////////////////////////////////////////////////////////////////
% This script finds how large a randomly distributed group of people
% has to be before any two of them have birthdays during the same 
% week, utlizing the monte carlo method.  

% Clean up the matlab workspace
clc; clear all; close all;

% Define the number of trials and preallocate the N-Values vector
trials = 10000;
N = zeros(1,trials);

for k = 1:trials
    counter = 1;
    shared = 0;
    
    % Group size limited to 53 because there cannot be greater than 53
    % random birthdays that are further than one week apart
    group = zeros(1, 53);
    
    while shared == 0 && counter <= 53
        % Add a random birthday to the group
        group(counter) = randi(365);
        
        % Check the proximity of the new birthday to others in the group
        for j = 1:counter
            difDays = abs(group(j) - group(counter));
            % If any bday is within 7 days, record the # of people in the group to N
            if j < counter && (difDays < 7 || difDays > 358)
                N(k) = sum(group ~= 0);
                shared = 1;
            end
        end
        
        counter = counter + 1;
    end
end

% print the results
med = ceil(median(N));
fprintf('Median Number of People = %.f ', med);

histogram(N);
xlabel('Number of People in a Group');
ylabel('Frequency of Shared Birthdays');
title('Distribution of groups with Shared Birthdays');
