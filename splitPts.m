% This function takes a vector input defining a set of coordinates with
% respect to one axis. The function then takes the input vector and
% returns one twice the size, with a midpoint 'injected' between each of
% the original points in (x).  

function [xs] = splitPts(x)

    % count the length of the input vector and preallocate memory for the output
    n = length(x);
    xs = zeros(1, 2*n);

    % Assign values of x to their corresponding locations in xs
    for k=1:n
        xs(2*k - 1) = x(k);
    end

    % Generate midpoints in xs
    for k = 2:2:2*n
        if k < 2*n
            xs(k) = (xs(k-1) + xs(k+1))/2;
        elseif k == 2*n
            xs(k) = (xs(k-1) + xs(1))/2;
        else
            error('check function');
        end   
    end
end