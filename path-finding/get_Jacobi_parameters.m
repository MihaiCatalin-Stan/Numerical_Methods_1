function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
    [m, n] = size(Link);
    % matricea de iteratie Jacobi facuta din liniile si coloanele specifice
    % pozitiilor din labirint (fara win si lose)
	G = Link(1:m - 2, 1:n - 2);
    % vectorul de iteratie Jacobi facut doar din coloana pozitiei de win
    c = Link(1:m - 2, n - 1);

end
