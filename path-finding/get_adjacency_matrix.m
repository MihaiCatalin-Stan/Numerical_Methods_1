function [Adj] = get_adjacency_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  Adj = sparse(m * n, m * n + 2);
  for i = 1:m
      for j = 1:n
          b0 = mod(Labyrinth(i, j), 2); % verificam perete stanga
          if (b0 == 0)
              % daca ne aflam pe prima coloana modificam adj pe pozitia
              % specifica lose (pentru ca verificam peretele din stanga)
              if (j == 1)
                Adj((i - 1) * n + j, m * n + 2) = 1;
              else
                Adj((i - 1) * n + j, (i - 1) * n + j - 1) = 1;
              end
          end
          % daca bit ul este 1 il scadem pentru a nu influenta impartirea
          % la 2 cand cautam bit ul urmator
          if (b0 == 1)
              Labyrinth(i, j) = Labyrinth(i, j) - 1;
          end
          Labyrinth(i, j) = Labyrinth(i, j) / 2;
          b1 = mod(Labyrinth(i, j), 2); % verificam perete dreapta
          if (b1 == 0)
              % acelasi lucru ca la cazul anterior, dar verificam daca ne
              % aflam pe ultima coloana in loc de prima
              if (j == n)
                Adj((i - 1) * n + j, m * n + 2) = 1;
              else
                Adj((i - 1) * n + j, (i - 1) * n + j + 1) = 1;
              end
          end
          if (b1 == 1)
              Labyrinth(i, j) = Labyrinth(i, j) - 1;
          end
          Labyrinth(i, j) = Labyrinth(i, j) / 2;
          b2 = mod(Labyrinth(i, j), 2); % verificam perete jos
          if (b2 == 0)
              % verificam daca ne aflam pe ultima linie caz in care dam
              % update pozitiei de win in adj
              if (i == m)
                  Adj((i - 1) * n + j, m * n + 1) = 1;
              else
                  Adj((i - 1) * n + j, i * n + j) = 1;
              end
          end
          if (b2 == 1)
              Labyrinth(i, j) = Labyrinth(i, j) - 1;
          end
          Labyrinth(i, j) = Labyrinth(i, j) / 2;
          b3 = mod(Labyrinth(i, j), 2); % verificam perete sus
          if (b3 == 0)
              % din nou dam update pozitiei de win in adjacency, dar de
              % data asta daca ne aflam pe prima linie
              if (i == 1)
                  Adj((i - 1) * n + j, m * n + 1) = 1;
              else
                  Adj((i - 1) * n + j, (i - 2) * n + j) = 1;
              end
          end
      end
  end
  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;
end
