function [ r ] = gaussElimination( A, b)
%GAUSSELIMINATION Eliminacja Gaussa
%   Metoda z czesciowym wyborem elementu glownego

% Dane testowe z ksiazki
%A = [3 1 6;2 1 3;1 1 1];
%b = [2;7;4];

n = size(A, 1);

M = [A b];
X = zeros(n, 1);

% dokonujemy n - 1 krokow (przeksztalcen), jednoczesnie kolumna na ktorej operujemy
for k = 1 : n - 1
    main_element = 0;
    ik = M(k,k);
    
    % wybieramy element glowny
    for j = k + 1 : n
        if (abs(M(j,k)) > main_element)
            main_element = abs(M(j,k));
            ik = j;
        end
        
        % wybralismy element maksymalny w kolumnie k 
        % i zapisalismy w jakim byl rzedzie w ik
        % teraz zamieniamy rzad k z ik
        if (ik ~= k)
            temp = M(k,:);
            M(k,:) = M(ik,:);
            M(ik,:) = temp;
        end
    end
    
    % zakladamy ze M(ik,k) != 0, bo A jest nieosobliwa
    % jesli jest, to wkradl sie blad
    if (M(ik, k) == 0)
        disp('Macierz A osobliwa - nie mozna rozwiazac. Blad programu.');
        break
    end
    
    column_factor = M(k, k);
    % wyliczamy wspolczynniki do przeksztalcenia wierszy
    for r = k + 1 : n
        l_rk = M(r, k) / column_factor;
        % przemnazamy wiersze po kolei w_i = w_i - l_i:i-1*w_i-1
        for i = k : n + 1
            M(r,i) = M(r, i) - l_rk*M(k, i);
        end
        % nasza macierz wynikowa M to polaczenie macierzy L i U
        % podstawiamy elementry macierzy L w miejsce wyzerowanych
        % elementow z A aby zaoszczedzic pamiec
        M(r,k) = l_rk;
    end
end

% "odzyskujemy" wektor b
b = M(:, n + 1);

% nasza macierz M dzielimy na macierze L i U
% macierz L - diagnostycznie
L = eye(n);
U = zeros(n);
% iteracja po kolumnach
for i = 1 : n
    % iteracja po wierszach
    for k = 1 : n
        if (k >= i + 1) 
            L(k, i) = M(k, i);
        else
            U(k, i) = M(k, i);
        end 
    end
end

% rozwiazanie ukladu
% metoda back-substitution 
% czyli idziemy od ostatniego wiersza, gdzie mamy od razu rozwiazanie xn
% pierwsze dwa elementy wyliczamy "recznie"
X(n) = b(n) / U(n, n);
X(n - 1) = (b(n - 1) - U(n - 1, n) * X(n)) / U(n - 1, n - 1);

% pozostale elementy
for k = 2 : n - 1
    % wlasciwe k 
    k1 = n - k;
    suma = 0;
    for j = k1 + 1 : n
        suma = suma + U(k1, j)*X(j);
    end
    X(k1) = (b(k1) - suma) / U(k1, k1);
end


% obliczenie bledu rozwiazania
% jako normy residuum
% liczymy residuum
r = b - U * X;
% norma druga residuum
r = r.^2;
r = sqrt(sum(r));

end