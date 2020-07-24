

%%
addpath('./scripts/');

filename = './data/normalised_heart_stroke_dataset.xlsx';
normalized_data = xlsread(filename, 1);
number_of_positive_stroke = sum(normalized_data(:,12) == 1);
number_of_negative_stroke = sum(normalized_data(:,12) == 0);
total_observations = number_of_positive_stroke + number_of_negative_stroke;

percentage_of_data = 100;
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
precision_matrix = [];
recall_matrix = [];
fscore_matrix = [];

no_of_experiments = 100;
for v=1:no_of_experiments
    
    disp(['performing for experiment = ', num2str(v), '/', num2str(no_of_experiments)]);
    
    y=datasample(NormalizedDatanoo,yes_length,'Replace', false');
    newtable=[y;NormalizedDatayess];
    z=datasample(newtable,yes_length+yes_length,'Replace', false');
    
    accuracy_array = [];
    precision_array = [];
    recall_array = [];
    fscore_array = [];
        
    for u=1:10

        disp(['performing for feature = ', num2str(u), '/10']);

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

        [precision, recall, fscore, accuracy] =  find_scores(label, Y_test);
              
        accuracy_array = cat(2,accuracy_array,accuracy);
        precision_array = cat(2,precision_array,precision);
        recall_array = cat(2,recall_array,recall);
        fscore_array = cat(2,fscore_array,fscore);
        
    end
    
    accuracy_matrix = cat(1,accuracy_matrix,accuracy_array);
    precision_matrix = cat(1,precision_matrix,precision_array);
    recall_matrix = cat(1,recall_matrix,recall_array);
    fscore_matrix = cat(1,fscore_matrix,fscore_array);
    
end


save('./results/score_matrix_T2_F1.mat','accuracy_matrix', 'precision_matrix', 'recall_matrix', 'fscore_matrix')


%%

% If needed to re-draw the box-plot from saved .mat file
load('./results/score_matrix_T2_F1.mat')

% Will be done offline
figure(1);
boxplot(accuracy_matrix);
ylim([0 1]);
ylabel('Accuracy','FontSize',12);
set(gca,'Xtick',1:10,'XTickLabel',{'gender', 'age', 'hypertension', 'heart disease', 'ever married', 'work type', 'residence type', 'glucose level', 'bmi', 'smoking status'});
xtickangle(90);


avg_precision = nanmean(precision_matrix);
avg_recall = nanmean(recall_matrix);
avg_fscore = nanmean(fscore_matrix);
avg_accuracy = nanmean(accuracy_matrix);

fileID=fopen('./results/Table2-values.txt','wt');
fprintf(fileID,'Average Precision across 10 features are:\n');
fprintf(fileID,'%f\n',avg_precision);
fprintf(fileID,'\n\n\n');

fprintf(fileID,'Average Recall across 10 features are:\n');
fprintf(fileID,'%f\n',avg_recall);
fprintf(fileID,'\n\n\n');

fprintf(fileID,'Average Fscore across 10 features are:\n');
fprintf(fileID,'%f\n',avg_fscore);
fprintf(fileID,'\n\n\n');


fprintf(fileID,'Average Accuracy across 10 features are:\n');
fprintf(fileID,'%f\n',avg_accuracy);
fprintf(fileID,'\n\n\n');


fclose(fileID);

%%
