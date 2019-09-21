% September 20, 2019
% /////////////////////////////////////////////////////////
% This script uses a monte carlo approach to approximate pi
clear all; close all;

n = [100, 250, 500, 1000, 1500, 3000, 4500, 6000, 9000, 12000, 15000];
trials = length(n);

for k=1:trials
    grid = zeros(n(k));
    in_circle = 0;
    out_circle = 0;
    
    % Uniformly distribute points in the n by n matrix and count how
    % many are inside vs outside the quadrant with radius n
    for i=1:n(k)
        for j=1:n(k)
            if rand < 0.5
                if sqrt(i^2 + j^2) <= n(k)
                    in_circle = in_circle + 1;
                    grid(i,j) = 1;
                else
                    out_circle = out_circle + 1;
                    grid(i,j) = 2;
                end
            end
        end
    end
    
    % the ratio of pts inside vs the total # of points is approx pi/4
    pi_approx  = (in_circle / (in_circle + out_circle)) * 4;
    imagesc(grid);
    axis equal;
    title(['n = ', num2str(n(k)), ', pi ~ ', num2str(pi_approx)]);
    drawnow;
    if n(k) < 3000
        pause(1);
    end
end