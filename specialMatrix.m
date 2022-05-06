function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice

%Throw error if less than 2 inputs
    if nargin < 2
        error("Not Enough Inputs")
    end
%Create Matrix
    A = zeros(n,m);
%Set 1st row to num of column
    for i=1:m
        A(1,i) = i;
    end
%Set 1st column to num of rown
    for i=1:n
        A(i,1) = i;
    end
%Set each element to sum of left and above
    for x=2:n
        for y=2:m
            A(x,y) = A(x-1,y)+A(x,y-1);
        end 
    end
end
% Things beyond here are outside of your function