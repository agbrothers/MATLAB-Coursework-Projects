% This function takes in a vector and redifines its values using a weighted
% average technique.  All entries are averaged with their neighbors, and
% the weights for each component of that computation is determined by the
% vector w, which is provided as an input to the function. 

function [xa] = averagePts(xs, w)
    n = length(xs);
    xa = zeros(1,n);

    if sum(w) ~= 0
        w1 = w(1)/sum(w);
        w2 = w(2)/sum(w);
        w3 = w(3)/sum(w);
    else
        error('The sum of the components in the w vector is zero');
    end

    for k=1:n
        if k == 1
            xa(k) = w1*xs(n) + w2*xs(k) + w3*xs(k+1);
        elseif k == n
            xa(k) = w1*xs(k-1) + w2*xs(k) + w3*xs(1);
        else
            xa(k) = w1*xs(k-1) + w2*xs(k) + w3*xs(k+1);
        end
    end
end
