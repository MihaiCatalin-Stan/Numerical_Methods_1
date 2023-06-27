function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

    % construim matricile pentru transformarile liniare
    Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(params((1 + (hidden_layer_size * (input_layer_size + 1))):end), output_layer_size, (hidden_layer_size + 1));
    
    % initializam matricea corespunzatoare lui y cu label urile asociate
    y_matrix = eye(output_layer_size);
    y_matrix = y_matrix(y,:);

    % initializari
    m = size(X, 1);
    J = 0;
    Theta1_grad = zeros(size(Theta1));
    Theta2_grad = zeros(size(Theta2));
    
    % FORWARDPROPAGATION
    % construim vectorul activarilor
    a1 = [ones(m, 1) X];
    % se aplica transformarea liniara
    z2 = a1 * Theta1';
    % se aplica functia de activare si se adauga unitatea pentru bias
    a2 = [ones(size(z2, 1), 1) sigmoid(z2)];
    z3 = a2 * Theta2';
    % construim predictiile ultimului layer fara a mai adauga
    % unitate de bias
    a3 = sigmoid(z3);
    
    % BACKPROPAGATION
    % determinam eroarea layer ului de out
    delta3 = a3 - y_matrix;
    % acumulam gradientii pentru trecerea de la layer ascuns
    % la layer de out
    delta_mare2 = delta3' * a2;
    % calculam derivata functiei sigmoide dupa formula
    sigmoid_derivat = sigmoid(z2) .* (1 - sigmoid(z2));
    % determinam eroarea layer ului ascuns
    delta2 = delta3 * Theta2(:, 2:end) .* sigmoid_derivat;
    % acumulam gradientii
    delta_mare1 = delta2' * a1;

    % functia de cost a unei retele neurale
    for i = 1:m
        J = J - log(a3(i,:))*y_matrix(i,:)' - log(1 - a3(i,:))*(1 - y_matrix(i,:))';
    end
    J = J / m;
   
    % adaugam si regularizarea functiei de cost
    regulation_term = 0;
    for i = 1:size(Theta1, 1)
        for j = 2:size(Theta1, 2)
            regulation_term = regulation_term + Theta1(i, j)^2;
        end
    end
    for i = 1:size(Theta2, 1)
        for j = 2:size(Theta2, 2)
            regulation_term = regulation_term + Theta2(i, j)^2;
        end
    end
    regulation_term = (lambda / (2 * m)) * regulation_term;
    J = J + regulation_term;
    
    % impartim acumularea gradientilor la numarul exemplelor de antrenament
    Theta1_grad = (1 / m) * delta_mare1;
    Theta2_grad = (1 / m) * delta_mare2;
    regulation_term1 = (lambda / m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
    regulation_term2 = (lambda / m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
    % se adauga si termenul corespunzator regularizarii
    Theta1_grad = Theta1_grad + regulation_term1;
    Theta2_grad = Theta2_grad + regulation_term2;
    
    % desfasuram in sfarsit si gradientii :')
    grad = [Theta1_grad(:) ; Theta2_grad(:)];

  end
