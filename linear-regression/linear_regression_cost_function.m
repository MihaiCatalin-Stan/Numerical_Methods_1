function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

 [m, n] = size(FeatureMatrix);
 Error = 0; % initializam suma functiei de cost

 % calculam suma folosita in eroare dupa formula din documentatie
 for i = 1:m
     % parcurgem theta de la 2 la end pentru ca primul element e 0 (si
     % pentru ca daca ramane acolo nu are aceleasi dimensiuni cu matricea,
     % deci nu se poate face inmultirea)
     Error = Error + (FeatureMatrix(i, 1:n) * Theta(2:end) - Y(i))^2;
 end

 Error = Error / (2 * m);

end