% This function takes a vector element y as an input and the (method)
% specification to calulate one of three Runge-Kutta approximations for a
% given differential equation.  The curve approximation covers the time
% step specified by the input variable dt. 

function [y] = advanceRK(y, dt, method)
halfLife = 2.45;

    switch(method)
        case 1  % RK1
            c1 = dt * (-log(2)/halfLife) * y;
            y = y + c1;
                                
        case 2  % RK2  
            c1 = dt * (-log(2)/halfLife) * y;
            c2 = dt * (-log(2)/halfLife) * (y + 0.5*c1);
            y = y + c2;
        
        case 4  % RK4
            c1 = dt * (-log(2)/halfLife) * y;
            c2 = dt * (-log(2)/halfLife) * (y + 0.5*c1);
            c3 = dt * (-log(2)/halfLife) * (y + 0.5*c2);
            c4 = dt * (-log(2)/halfLife) * (y + c3);
            y = y + (1/6)*c1 + (1/3)*c2 + (1/3)*c3 + (1/6)*c4;
        
        otherwise
            error('The method chosen is invalid, choose only 1, 2, or 4');
    end
end