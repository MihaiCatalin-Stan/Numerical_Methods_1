function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
 
  % amestecam exemplele
  [m, n] = size(X);
  % alege un intreg random de la 1 la m pentru o permutare
  pos = randperm(m);
  % facem permutarea in matrice
  X = X(pos, :);
  % facem permutarea in vector
  y = y(pos);
  % luam indicele de fraction impartind intr-o fractiune egala cu percent
  fraction = round(percent * size(X, 1));
  
  % impartim datele
  % luam primele split linii in X_train
  X_train = X(1:fraction, :);
  y_train = y(1:fraction); 
  % luam restul de linii in X_test      
  X_test = X(fraction + 1:end, :);
  y_test = y(fraction + 1:end);
  
end
