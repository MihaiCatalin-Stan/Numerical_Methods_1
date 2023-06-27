function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
  
  % aplicam metoda gradientului conjugat din documentatie
  [m, n] = size(FeatureMatrix);
  Theta = zeros(n + 1, 1);  
  % pe langa ce avem in documentatie, adaugam un old_r pentru a retine
  % valoarea sa la pasul anterior
  old_r = Y - FeatureMatrix * Theta(2:end);
  r = old_r;
  v = r;
  tol_s = tol^2;
  steps = 1;
  while (steps <= iter && old_r' * old_r > tol_s)
      % modificam r la pasul anterior din moment ce urmeaza sa il modificam
      % in liniile ca urmeaza
      old_r = r;
      % modificam r, t si s dupa formulele din documentatie
      t = (old_r' * old_r) / (v' * FeatureMatrix * v);
      Theta(2:end) = Theta(2:end) + t * v;
      r = old_r - t * FeatureMatrix * v;
      s = (r' * r) / (old_r' * old_r);
      v = r + s * v;
      % incrementam numarul de pasi
      % (k din documentatie, redenumit pentru a fi mai sugestiv)
      steps = steps + 1;
  end
end