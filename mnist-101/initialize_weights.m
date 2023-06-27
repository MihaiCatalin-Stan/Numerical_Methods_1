function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values
  
  e = sqrt(6) / sqrt(L_prev + L_next);
  % facem o matrice cu valori intre 0 si 1
  matrix = rand(L_next, L_prev + 1);
  % ponderam matricea astfel incat sa ia valori intre -e si e
  matrix = (e + e) * matrix - e;
  
end
