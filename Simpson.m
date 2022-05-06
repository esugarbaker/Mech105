function [I] = Simpson(x, y)
    if length(x) ~= length(y)
        error("Inputs not the same length")
    end
    val = x(2)-x(1); 
    for z=2:length(x)
        if x(z) - x(z-1) ~= val
            error("Inputs not evenly spaced")
        end
    end
    I = 0;
    if length(x) == 2
        warning("Final Values will use Trapezoid")
        h = (x(length(x)) - x(length(x)-1));
        I = I + (h/2)*(y(length(x) + y(length(x)-1)));
    elseif mod(length(x),2) == 0
        warning("Final Values will use Trapezoid")
        for z=1:2:length(x)-3
            h = (x(z+2)-x(z))/2;
            I = I + (h/3)*(y(z)+4*y(z+1)+ y(z+2));
        end
        h = (x(length(x)) - x(length(x)-1));
        I = I + (h/2)*(y(length(x)) + y(length(x)-1));
    else
        for z=1:2:length(x)-2
            h = (x(z+2)-x(z))/2;
            I = I + (h/3)*(y(z)+4*y(z+1)+ y(z+2));
        end
    end
end