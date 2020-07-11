function [impact_value] =  impactfactor_from_data(data_matrix, feature_number)


    normalized_data = data_matrix;
    number_of_positive_stroke = sum(normalized_data(:,12) == 1);
    number_of_negative_stroke = sum(normalized_data(:,12) == 0);
    total_observations = number_of_positive_stroke + number_of_negative_stroke;

    % This step is performed for shuffling the dataset
    sampledata=datasample(normalized_data,total_observations,'Replace', false');

    % original = 5 4 5
    % % Discretization
    qw = multithresh(sampledata(:,3),7);
    age_levels=[0,qw, max(sampledata(:,3))];
    quantised_age = discretize_my(sampledata(:,3), age_levels);

    qw1 = multithresh(sampledata(:,9),3);
    avgglucose_levels = [0,qw1, max(sampledata(:,9))];
    quantised_avgglucose = discretize_my(sampledata(:,9), avgglucose_levels);

    qw2 = multithresh(sampledata(:,10),3);
    bmi_levels = [0,qw2, max(sampledata(:,10))];
    quantised_bmi = discretize_my(sampledata(:,10), bmi_levels);


    newsampledata = cat(2, sampledata(:,2), quantised_age, sampledata(:,4), sampledata(:,5), sampledata(:,6), sampledata(:,7), sampledata(:,8), quantised_avgglucose, quantised_bmi, sampledata(:,11), sampledata(:,12));

    [impact_value] =  impact_factor(newsampledata,feature_number,11);


    
end
