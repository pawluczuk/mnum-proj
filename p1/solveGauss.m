function [ ] = solveGauss( )
%SOLVEGAUSS Wygeneruj uklady rownan
%   Rozwiaz rownania przy pomocy eliminacji Gaussa z czesciowym wyborem
%   elementu podstawowego dla roznej liczby rownan.
%   Dla kazdego zestawu danych generuje wykres zaleznosci bledu
%   od liczby rownan.

% zestaw danych od 1 do 3
for i = 1 : 3
    iterations = 6;
    results = zeros(iterations, 1);
    iterationsTable = zeros(iterations, 1);
    for n = 1 : iterations
        equations_number = 2^n * 10;
        [ A, b ] = generateMatrix(i, equations_number);
        r = gaussElimination(A, b);
        results(n) = r;
        iterationsTable(n) = equations_number;
    end
    [iterationsTable results]
    titleString = sprintf('Zestaw danych: %d', i);
    figure()
    plot(iterationsTable, results)
    title(titleString)
    xlabel('Ilosc iteracji')
    ylabel('Norma residuum')
end

end

