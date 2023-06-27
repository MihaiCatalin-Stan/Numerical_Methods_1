function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state
  
  [m, ~] = size(path);
  % initializam decoded_path fara pozitia de win
  decoded_path = zeros(m - 1, 2);
  for i = 1:m - 1
      % intai punem linia path ului nostru in decoded_path
      decoded_path(i, 1) = ceil(path(i, 1) / cols);
      % determinam coloana element ului nostru din path
      decoded_path(i, 2) = mod(path(i, 1) - 1, cols) + 1;
  end

end