function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
  x = x0;
  old_x = x;
  steps = 0;
  % algoritm Jacobi
  while (1)
    % calculam vectorul solutiilor aproximative
    x = G * old_x + c;
    % calculam eroarea solutiilor
    err = norm(x - old_x);
    old_x = x;
    steps = steps + 1;
    % verificam daca am atins numarul maxim de pasi sau daca eroarea
    % rezultatelor noastre se incadreaza in toleranta acceptata
    if ((steps == max_steps + 1) || (err < tol))
      return;
    end
  end
end
