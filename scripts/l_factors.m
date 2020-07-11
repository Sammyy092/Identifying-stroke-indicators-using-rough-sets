function loading_factors = l_factors(input_data)

    [~, no_of_features] = size(input_data);


    % Normalise the matrix
    input_data=input_data-mean(input_data(:));
    input_data=input_data/std(input_data(:));

    % Direct formula
    coeff = pca(input_data);
    loading_factors = abs(coeff(:,1))';

end

