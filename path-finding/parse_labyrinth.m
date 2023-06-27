function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits
  
  % Labyrinth -> the matrix of all encodings for the labyrinth's walls
  
  % TODO: parse_labyrinth implementation
    fin = fopen(file_path, "r");
    % citim dimensiunile labirintului
    m = fscanf(fin, "%d", 1);
    n = fscanf(fin, "%d", 1);
    Labyrinth = zeros(m, n);
    % citim element cu element codificarile labiritnului
    for i = 1:m
        for j = 1:n
            Labyrinth(i, j) = fscanf(fin, "%d", 1);
        end
    end
    fclose(fin);
end
