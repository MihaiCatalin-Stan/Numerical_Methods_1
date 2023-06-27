function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  [m, n] = size(FeatureMatrix);
  Error = 0;

  % calculam suma folosita in eroare dupa formula din documentatie
  for i = 1:m
      % parcurgem theta de la 2 la end pentru ca primul element e 0 (si
      % pentru ca daca ramane acolo nu are aceleasi dimensiuni cu matricea,
      % deci nu se poate face inmultirea)
      Error = Error + (Y(i) - FeatureMatrix(i, 1:n) * Theta(2:end))^2;
  end

  % calculam partea erorii care e diferita de celelalte
  % doua functii de cost
  sum = 0;
  for j = 2:n + 1
      sum = sum + Theta(j)^2;
  end

  Error = Error / (2 * m) + lambda * sum;

end