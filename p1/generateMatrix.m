function [ A , B ] = generateMatrix( option, equations )
%GENERATEMATRIX Generowanie macierzy z danymi
%   option - który zestaw danych generujemy (1,2 lub 3)
%   equations - liczba rownan
A = zeros(equations);       % empty A array with dimensions [equations x equations]
B = zeros(equations,1);     % empty B array with dimensions [equations x 1]

if (option == 1)
    for i = 1:equations
        % replace B[i,1] with appropriate values
        B(i,1) = 1.5 + 0.2*i;
        % replace A[i,j] with appropriate values
        for j = 1:equations
            if ( i == j ) 
                A(i,j) = 5;
            elseif ( i == j - 1 || i == j + 1 ) 
                    A(i,j) = 2;
            else A(i,j) = 0;
            end
        end
    end
end

if (option == 2)
    for i = 1:equations
        % replace B[i,1] with appropriate values
        B(i,1) = 1.0 + 0.2*i;
        % replace A[i,j] with appropriate values
        for j = 1:equations
            if ( i == j )  
                A(i,j) = 0.125;
            else
                A(i,j) = 3*(i - j) + 2;
            end
        end
    end
end


if (option == 3)
    for i = 1:equations
        % replace B[i,1] with appropriate values
        if (mod(i, 2) == 0)
            B(i,1) = 5 / (4 * i);
        else
            B(i,1) = 0;
        end
        % replace A[i,j] with appropriate values
        for j = 1:equations
            A(i,j) = 3 / (5 * (i + j + 1));
        end
    end
end
    
end