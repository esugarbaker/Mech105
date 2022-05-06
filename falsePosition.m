function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%Checking for Errors
    if nargin < 3
        error("Not Enough Inputs")
    end
    if func(xl) * func(xu) > 0
        disp("Incorrect Bounds")
        return
    end
 %Setting Defaults
    if ~exist('maxit','var')
        maxit = 200;
    end
    if ~exist('es','var')
        es = .0001;
    end
    ea = 1000;
    oldX = xl;
    iter = 0;
%Check Bounds for Root
    if func(xl) == 0
        newX = xl;
        ea = 0;
    end
    if func(xu) == 0
        newX = xu;
        ea = 0;
    end
%Find Root
    while ea>es && iter<maxit
        iter = iter+1;
        newX = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
%Find the Error
        ea = abs((newX-oldX)/newX) * 100;
        oldX = newX;
%Check if Exact
        if func(newX) == 0
            ea = 0;
        end
%Decide which bound to replace
        if func(newX) * func(xu) < 0
            xl = newX;
        else
            xu = newX;
        end
    end
%Set Returnables
    root = newX;
    fx = func(root);
end