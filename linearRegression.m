function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%Evan Sugarbaker
    %Check for Error
    if size(x) ~= size(y)
        error("Not the same size")
    end
    %Sort and Filter
    [fY, sortOrder] = sort(y);
    fX = x(sortOrder);
    Q1 = fY(floor((size(x,2)+1)/4));
    Q3 = fY(floor((3*size(x,2)+3)/4));
    IQR = Q3-Q1;
    z=1;
    while z < size(fX,2)+1
        if fY(z)>Q3+(1.5*IQR)
            fY(z)=[];
            fX(z)=[];
        elseif fY(z)<Q1-(1.5*IQR)
            fY(z)=[];
            fX(z)=[];
        else
            z=z+1;
        end
    end
    %Set Variables
    sumXY = sum(fX.*fY);
    sumXSquare = sum(fX.^2);
    sumYSquare = sum(fY.^2);
    n = size(fX,2);
    %Calc m and b
    slope = ((n*sumXY) - (sum(fX)*sum(fY))) / ((n*sumXSquare)-(sum(fX))^2);
    intercept = mean(fY) - (slope*mean(fX));
    %Calc R^2
    Rsquared = (((n*sumXY)-(sum(fX)*sum(fY)))/(sqrt((n*sumXSquare)-(sum(fX)^2))*sqrt((n*sumYSquare)-(sum(fY)^2))))^2;
end
