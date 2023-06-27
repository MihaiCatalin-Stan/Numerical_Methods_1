function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples
  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);
  for i = 1:m
      % indicele coloanei din FeatureMatrix
      k = 1;
      for j = 1:n
          % verificam daca pozitia actuala are un string
          if(~isnumeric(InitialMatrix{i, j}))
              % in functie de tipul string ului modificam FeatureMatrix ul
              % corespunzator
              if (strcmp(InitialMatrix{i, j}, "yes"))
                  FeatureMatrix(i, k) = 1;
              end
              if (strcmp(InitialMatrix{i, j}, "semi-furnished"))
                  FeatureMatrix(i, k) = 1;
                  FeatureMatrix(i, k + 1) = 0;
                  k = k + 1;
              end
              if (strcmp(InitialMatrix{i, j}, "furnished"))
                  FeatureMatrix(i, k) = 0;
                  FeatureMatrix(i, k + 1) = 0;
                  k = k + 1;
              end
              if (strcmp(InitialMatrix{i, j}, "unfurnished"))
                  FeatureMatrix(i, k) = 0;
                  FeatureMatrix(i, k + 1) = 1;
                  k = k + 1;
              end
          % in cazul caracterelor numerice doar le adaugam in noua matrice
          else
              FeatureMatrix(i, k) = InitialMatrix{i, j};
          end
          % trecem pe coloana urmatoare din FeatureMatrix (sarim peste
          % 2 coloane in cazurile furnished/unfurnished/semi-furnished)
          k = k + 1;
      end
  end
end