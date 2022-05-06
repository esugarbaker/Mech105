function [L, U, P] = luFactor(A)
    if size(A,2) ~= size(A,1)
        error("Non-Square Coeficient Matrix")
    end
    P = eye(size(A,2));
    L = eye(size(A,2));
    U = A;
    for x=1:size(U,2)-1
        %If not First Row Pivot
        G = U(:,x);
        if x>1
            %Remove all numbers above x from being checked
            G(1:x-1) = 0;
        end
        %Check to see if its already max
        if U(x,x) ~= max(G)
            %Find Max
            [v,k] = max(abs(G));
            %Swap Around Rows
            C = U(x,:);
            U(x,:) = U(k,:);
            U(k,:) = C;
            C = P(x,:);
            P(x,:) = P(k,:);
            P(k,:) = C;
        end
        %Do Elimination
        for j=x+1:size(U,2)
            Coef = U(j,x)/U(x,x);
            NewRow = Coef .* U(x,:);
            U(j,:) = U(j,:) - NewRow;
        end
    end
    L=(P*A)/U;
end