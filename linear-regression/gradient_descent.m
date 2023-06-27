function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations

  % Theta -> the vector of weights

  % initializam vectorul coloana theta
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n + 1, 1);

  for k = 1:iter
      % calculam derivatele partiale in raport cu theta(j) (adica gradientul)
      for j = 1:n
          grad = 0;
          % calculam suma pentru fiecare element din gradient
          for i = 1:m
            grad = grad + (FeatureMatrix(i, 1:n) * Theta (2:end) - Y(i)) * FeatureMatrix(i, j);
          end
          grad = grad / m;
          % modificam theta | avem j + 1 deoarece prima valoare e 0
          Theta(j + 1) = Theta(j + 1) - alpha * grad;
      end
  end
  
  % format long pentru ca altfel nu ne afiseaza toate zecimalele
  format long;
end