function [] = solveJacob( )
% solveJacob Generuje macierze i przekazuje do rozwiazania
% aby je rozwiazan metoda Jacobiego

N = 2000;

for i = 1 : 3
    for k = 3 : 9
        [A, b] = generateMatrix(i, k);
        Jacob(A, b, N);
    end
end

end

