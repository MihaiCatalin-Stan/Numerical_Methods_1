function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  fin = fopen(file_path, "r");
  % scapam de linia header
  line = fgets(fin);
  % initializam indicii matricii si a vectorului
  i = 1;
  j = 1;
  while (~feof(fin))
      line = fgets(fin);
      % scapam de \n de la finalul lui line, intrucat fgets citeste si
      % caracterul new line
      line = strtrim(line);
      % impartim linia in tokeni delimitati de "," care vor fi datele
      % noastre de adaugat in matrice (respectiv vector)
      [token, line] = strtok(line, ",");
      % punem prima valoare in Y
      Y(i, 1) = str2double(token);
      j = 1;
      % umplem InitialMatrix cu restul valorilor din line
      while (~isempty(line))
        [token, line] = strtok(line, ",");
        InitialMatrix{i, j} = token;
        j = j + 1;
      end
      i = i + 1;
  end
  % parcurgem matricea si inlocuim string urile care contin doar caractere
  % numerice cu transformarea lor in double
  m = i - 1;
  for i = 1:m
      for j = 1:12
          if (isnumeric(str2double(InitialMatrix{i, j})) && ~isnan(str2double(InitialMatrix{i, j})))
              InitialMatrix{i, j} = str2double(InitialMatrix{i, j});
          end
      end
  end
  fclose(fin);
end