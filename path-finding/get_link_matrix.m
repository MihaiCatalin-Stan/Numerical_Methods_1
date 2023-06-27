function [Link] = get_link_matrix (Labyrinth)
  [m, n] = size(Labyrinth);
  Link = sparse(m * n, m * n + 2);
  for i = 1:m
      for j = 1:n
          s = 0; % initializam suma elementelor de pe linie cu 0
          b0 = mod(Labyrinth(i, j), 2); % verificam perete stanga
          % daca avem vecin in stanga adaugam la suma
          if (b0 == 0)
              s = s + 1;
          end

          % setam primul bit pe 0 daca e nevoie si il stergem pentru
          if (b0 == 1) 
              Labyrinth(i, j) = Labyrinth(i, j) - 1;
          end
          Labyrinth(i, j) = Labyrinth(i, j) / 2;

          b1 = mod(Labyrinth(i, j), 2); % verificam perete dreapta
          if (b1 == 0)
              s = s + 1;
          end

          if (b1 == 1)
              Labyrinth(i, j) = Labyrinth(i, j) - 1;
          end
          Labyrinth(i, j) = Labyrinth(i, j) / 2;

          b2 = mod(Labyrinth(i, j), 2); % verificam perete jos
          if (b2 == 0)
              s = s + 1;
          end

          if (b2 == 1)
              Labyrinth(i, j) = Labyrinth(i, j) - 1;
          end
          Labyrinth(i, j) = Labyrinth(i, j) / 2;
         
          b3 = mod(Labyrinth(i, j), 2); % verificam perete sus
          if (b3 == 0)
              s = s + 1;
          end

          % adaugam elemente in matricea de probabilitati dupa formula
          % (adica impartim la numarul de vecini al nodului)
          if (b0 == 0)
              % luam in calcul si pozitia de lose
              if (j == 1)
                Link((i - 1) * n + j, m * n + 2) = 1 / s;
              else
                Link((i - 1) * n + j, (i - 1) * n + j - 1) = 1 / s;
              end
          end
          if (b1 == 0)
              % luam in calcul si pozitia de win
              if (j == n)
                Link((i - 1) * n + j, m * n + 2) = 1 / s;
              else
                Link((i - 1) * n + j, (i - 1) * n + j + 1) = 1 / s;
              end
          end
          if (b2 == 0)
              if (i == m)
                  Link((i - 1) * n + j, m * n + 1) = 1 / s;
              else
                  Link((i - 1) * n + j, i * n + j) = 1 / s;
              end
          end
          if (b3 == 0)
              if (i == 1)
                  Link((i - 1) * n + j, m * n + 1) = 1 / s;
              else
                  Link((i - 1) * n + j, (i - 2) * n + j) = 1 / s;
              end
          end
      end
  end
  Link(m * n + 1, m * n + 1) = 1;
  Link(m * n + 2, m * n + 2) = 1;
  
end
