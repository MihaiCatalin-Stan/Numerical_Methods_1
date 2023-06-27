% A vectorized function for the sigmoid calculation.

function [y] = sigmoid(x)
  y = 1 ./ (1 + e .^ (-x));
endfunction
