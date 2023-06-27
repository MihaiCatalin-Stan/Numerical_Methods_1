function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix
	
	% path -> the states chosen by the algorithm
  path = start_position;
  [n, m] = size(Adj);
  visited = zeros(n);
  visited(start_position) = 1;
  % vizualizam path ul ca un stack (adica respectam regula de LIFO) si
  % parcurgem labirintul pana nu mai avem ce vizita
  % (asemanator unui DFS, dar alegem vecinul pe care mergem in functie de
  % maximul probabilitatii)
  % (sau pana dam de pozitia de win)
  while(~isempty(path))
      % verificam daca am ajuns pe pozitia de win
      if (path(end) == n - 1)
          break;
      end
      pos = path(end);
      % initializam o un vector linie al vecinilor cu 0
      % (nu luam in considerare vecinul de lose)
      neighs = zeros(1, n - 1);
      for i = 1:n - 1
          % verificam daca avem muchie si 
          if (Adj(pos, i) && ~visited(i))
              % notam vecinii nevizitati
              neighs(1, i) = 1;
          end
      end
        
      % cautam vecinul cu probabilitatea maxima
      max_prob = 0;
      max_elem = 0;
      good = 0;
      for i = 1:n - 1
          if (neighs(1, i) == 1)
              curr_elem = i;
              curr_prob = probabilities(i); 
              if (curr_prob > max_prob)
                  max_prob = curr_prob
                  max_elem = curr_elem
                  good = 1;
              end
          end
      end
      
      % daca nu avem vecini nevizitati ne intoarcem in path
      if (~good)
         path = path(1:end - 1);
      else
          % in caz contrar avansam in path
         visited(max_elem) = 1;
         path(end + 1) = max_elem;
      end
  end
  path = path';
end
