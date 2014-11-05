function [] = Jacob( A, b, iterations )
%Jacob Rozwiazywanie ukladu rownan
%   metoda iteracyjna Jacobiego
% iterations - maksymalna liczba iteracji

% rzad macierzy A
n = size(A,1);

% rozbicie macierzy A = L + D + U:
% macierz naddiagonalna
U = triu(-A,1);
% macierz diagonalna
D = diag(diag(A));
% macierz poddiagonalna
L = tril(-A, -1);

Tj = inv(D)*(L+U);
cj = inv(D)*b;

% tolerancja - z gory ustalona
esp = 1e-10;
% zmienna do iteracji
k = 1;
% szukany wektor - zaczynamy od samych zer
x = zeros(n,1);

while k <= iterations
   x(:,k + 1) = Tj * x(:, k) + cj;
   if norm(x(:,k + 1) - x(:, k)) < esp
      disp('Osiagnieto zadany warunek stopu: ||x^(k+1) - x^(k)|| < esp dla wartosci:')
      disp('Liczba iteracji:');
      disp(k); 
      disp('x = ');
      disp(x(:,k + 1));
      break
   end
   k = k+1;
end

if ( norm(x(:,k + 1)- x(:, k)) > esp || k > iterations )
   disp('Nie udalo sie osiagnac warunku stop. Log:')
   disp('Esp:')
   disp(esp);
   disp('x = ');
   disp(x');
end

