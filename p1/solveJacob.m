function [] = solveJacob( )
% solveJacob Generuje macierze i przekazuje do rozwiazania
% aby je rozwiazan metoda Jacobiego

N = 1000;

for i = 1 : 3
    for k = 3 : 10
        [A, b] = generateMatrix(i, k);
        Jacob(A, b, N);
    end
end

end

