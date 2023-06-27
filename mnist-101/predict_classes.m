function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter

  % construim matricile pentru transformarile liniare
  Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, input_layer_size + 1);
  Theta2 = reshape(weights(hidden_layer_size * (input_layer_size + 1) + 1:end), output_layer_size, hidden_layer_size + 1);

  % initalizam vectorul activarilor si aplicam transformarea liniara ca la
  % functia anterioara
  m = size(X, 1);
  a1 = [ones(m, 1) X];
  z2 = a1 * Theta1';

  m = size(z2, 1);
  a2 = [ones(m, 1) sigmoid(z2)];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);
  
  % facem vectorul de predictii prin 
  [~, classes] = max(a3, [], 2);

end
