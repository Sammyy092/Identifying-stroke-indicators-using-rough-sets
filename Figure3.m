%This code provides the KNN results for each conditional attribute. 

addpath('./scripts/');
%%
filename = './data/normalised_heart_stroke_dataset.xlsx';
normalized_data = xlsread(filename, 1);
number_of_positive_stroke = sum(normalized_data(:,12) == 1);
number_of_negative_stroke = sum(normalized_data(:,12) == 0);
total_observations = number_of_positive_stroke + number_of_negative_stroke;

R_matrix = [];
for percentage_of_data = (10:10:100)
    
    disp(['performing for percentage = ', num2str(percentage_of_data)]);
    number_of_dataobs = round((percentage_of_data/100)*total_observations);

    sampledata=datasample(normalized_data,number_of_dataobs,'Replace', false');

    % Creating the random dataset having the rows with equal number of 0's and 1's in decsion attribute
    lastcoulumn=sampledata(:,11);
    NormalizedDatanoo=sampledata(lastcoulumn==0,:);
    NormalizedDatayess=sampledata(lastcoulumn==1,:);
    [no_length, ~] = size(NormalizedDatanoo);
    [yes_length, ~] = size(NormalizedDatayess);
    total_length=yes_length+yes_length;

    %Setting training and testing limits i.e 80% and 20%
    a=int16(total_length*80/100);
    test=int16(a+1);

    accuracy_matrix = [];
    impactscore_matrix = [];

    no_of_exps = 100;



    for v=1:no_of_exps


            disp(['performing for experiment = ', num2str(v), '/', num2str(no_of_exps)]);

            y=datasample(NormalizedDatanoo,yes_length,'Replace', false');
            newtable=[y;NormalizedDatayess];
            z=datasample(newtable,yes_length+yes_length,'Replace', false');

            accuracy_array = [];
            impactscore_array = [];
            for u=1:10

                % z is a new dataset having equal number of 1's and 0's in the decision attribute
                X_train = z(1:a, u);
                Y_train = z(1:a, 11);
                X_test = z(test:total_length, u);
                Y_test = z(test:total_length, 11);

                % KNN model
                %KNNModel = fitcknn(X_train, Y_train);
                %[label, score] = predict(KNNModel, X_test);


                % SVM model
                SVMModel = fitcsvm(X_train, Y_train);
                [label, score] = predict(SVMModel, X_test);

                accuracy = 100 - (sum(abs(label-Y_test))/length(Y_test))*100;
                accuracy_array = cat(2,accuracy_array,accuracy);

                impactscore =  impactfactor_from_data(sampledata, u);
                impactscore_array = cat(2,impactscore_array,impactscore);

            end

            accuracy_matrix = cat(1,accuracy_matrix,accuracy_array);
            impactscore_matrix = cat(1, impactscore_matrix, impactscore_array);


    end


    R_values = [];

    for t = 1:no_of_exps
        accuracy_vector = accuracy_matrix(t,:);
        impactscore_vector = impactscore_matrix(t,:);
        [R,~] = corr(accuracy_vector', impactscore_vector', 'Type', 'Pearson');
        R_values = cat(1,R_values,R);

    end


    R_matrix = cat(2,R_matrix,R_values);

end



save('./results/rmatrix_F3.mat','R_matrix');
disp ('rmatrix of Figure 3 saved');


%%
% ==============================================================

% The following code section can be run after the completion of
% experiments in the cluster
load('./results/rmatrix_F3.mat');


mean_across_percentage = mean(R_matrix);

% figure(1);
% boxplot(R_matrix);
% %ylim([0 1]);
% hold on;
% plot(mean_across_percentage, 'b');
% hold on;
% scatter(1:10, mean_across_percentage,'filled','o', 'b');
% set(gca,'Xtick',1:10,'XTickLabel',10:10:100);
% xlabel('Percentage of used dataset (in %)');
% ylabel('Correlation b/t accuracy and impact factor score');

%%
