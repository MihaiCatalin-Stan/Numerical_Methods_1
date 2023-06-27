function [Y, InitialMatrix] = parse_data_set_file(file_path)

  % deschidem fisierul si initializam  matricea respectiv vectorul
  fin = fopen(file_path, "r");
  m = fscanf(fin, "%d", 1);
  n = fscanf(fin, "%d", 1);
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  for i = 1:m
      % parcurgem liniile si citim primul element pe care il adaugam in Y
      Y(i) = fscanf(fin, "%d", 1);
      % restul elementelor de pe linia curenta sunt parcurse si adaugate pe
      % rand ca string uri in matricea noastra cu date
      for j = 1:n
          InitialMatrix{i, j} = fscanf(fin, "%s", 1);
      end
  end
  % parcurgem matricea si transformam string urile care contin doar
  % caractere numerice in valoarea lor double
  for i = 1:m
      for j = 1:n
          if (isnumeric(str2double(InitialMatrix{i, j})) && ~isnan(str2double(InitialMatrix{i, j})))
              InitialMatrix{i, j} = str2double(InitialMatrix{i, j});
          end
      end
  end
  fclose(fin);
end