%This code provides the KNN results for each conditional attribute. 

addpath('./scripts/');

filename = './data/normalised_heart_stroke_dataset.xlsx';
normalized_data = xlsread(filename, 1);
number_of_positive_stroke = sum(normalized_data(:,12) == 1);
number_of_negative_stroke = sum(normalized_data(:,12) == 0);
total_observations = number_of_positive_stroke + number_of_negative_stroke;

percentage_of_data = 100;
number_of_dataobs = round((percentage_of_data/100)*total_observations);

% Shuffling the data 
sampledata=datasample(normalized_data,number_of_dataobs,'Replace', false');

% Creating the balanced dataset
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


no_of_exps = 5000;

for v=1:no_of_exps 
    
    disp(['performing for experiment = ', num2str(v), '/', num2str(no_of_exps)]);
    y=datasample(NormalizedDatanoo,yes_length,'Replace', false');
    newtable=[y;NormalizedDatayess];
    z=datasample(newtable,yes_length+yes_length,'Replace', false');
      
    accuracy_array = [];
    for u=1:10
    
        disp(['performing for feature = ', num2str(u), '/10']);
        
        % z is a new dataset having equal number of 1's and 0's in the decision attribute
        X_train = z(1:a, u);
        Y_train = z(1:a, 11);
        X_test = z(test:total_length, u);
        Y_test = z(test:total_length, 11);
        
        % SVM model
        SVMModel = fitcsvm(X_train, Y_train);
        [label, score] = predict(SVMModel, X_test);

        accuracy = 100 - (sum(abs(label-Y_test))/length(Y_test))*100;
        accuracy_array = cat(2,accuracy_array,accuracy);
        
    end
    accuracy_matrix = cat(1,accuracy_matrix,accuracy_array);
        
end


% Accuracy computed after many experiments
avg_accuracy = nanmean(accuracy_matrix);
save('./results/avg_accuracy_T4_F2.mat','avg_accuracy', 'normalized_data');



% ==============================================================

% The following code section can be run after the completion of
% experiments in the cluster
load('./results/avg_accuracy_T4_F2.mat');


% Proposed approach
impact_vector = [];
for u=1:10
    [impact_value] =  impactfactor_from_data(normalized_data, u);
    impact_vector = cat(2,impact_vector,impact_value);
end

% Scatter plot
[RHO_proposed,~] = corr(avg_accuracy', impact_vector', 'Type', 'Pearson')


% figure(1);
% c = cell(10,1);
% c{1,1} = 'gender'; c{2,1} = 'age'; c{3,1} = 'hypertension'; c{4,1} = 'heart.disease';
% c{5,1} = 'ever.married'; c{6,1} = 'work.type'; c{7,1} = 'residence.type'; c{8,1} = 'avg.glucose.level';
% c{9,1} = 'bmi'; c{10,1} = 'smoking.status';
% scatter(avg_accuracy', impact_vector','filled');
% dx = 0.001; dy = 0.001;
% x = avg_accuracy';
% y = impact_vector';
% text(x+dx, y+dy, c);
% xlabel('Accuracy (in %)');
% ylabel('Impact factor');


% Bimodality
bimod_vector = [];
for u=1:10
    
    feature_vector = normalized_data(:,u+1);
    pbi_value = bimodality(feature_vector);
    bimod_vector = cat(2,bimod_vector,pbi_value);
end

% Scatter plot
[RHO_bimodality,~] = corr(avg_accuracy', bimod_vector', 'Type', 'Pearson')


% figure(2);
% %a = (1:length(bimod_vector))'; b = num2str(a); c = cellstr(b);
% c = cell(10,1);
% c{1,1} = 'gender'; c{2,1} = 'age'; c{3,1} = 'hypertension'; c{4,1} = 'heart.disease';
% c{5,1} = 'ever.married'; c{6,1} = 'work.type'; c{7,1} = 'residence.type'; c{8,1} = 'avg.glucose.level';
% c{9,1} = 'bmi'; c{10,1} = 'smoking.status';
% scatter(avg_accuracy', bimod_vector','filled');
% dx = 0.001; dy = 0.001;
% x = avg_accuracy';
% y = bimod_vector';
% text(x+dx, y+dy, c);
% xlabel('Accuracy (in %)');
% ylabel('Bimodality');



% Loading factor
input_data = normalized_data(:,2:11);
loading_factors = l_factors(input_data);
[RHO_loadingfactor,~] = corr(avg_accuracy', loading_factors', 'Type', 'Pearson')

% figure(3);
% c = cell(10,1);
% c{1,1} = 'gender'; c{2,1} = 'age'; c{3,1} = 'hypertension'; c{4,1} = 'heart.disease';
% c{5,1} = 'ever.married'; c{6,1} = 'work.type'; c{7,1} = 'residence.type'; c{8,1} = 'avg.glucose.level';
% c{9,1} = 'bmi'; c{10,1} = 'smoking.status';
% scatter(avg_accuracy', loading_factors','filled');
% dx = 0.001; dy = 0.001;
% x = avg_accuracy';
% y = loading_factors';
% text(x+dx, y+dy, c);
% xlabel('Accuracy (in %)');
% ylabel('Loading factors');



% Wilcoxon
input_data = normalized_data(:,2:11);
Group = normalized_data(:,12);
[~, wilcoxon_values] = rankfeatures(input_data', Group', 'Criterion', 'wilcoxon');
[RHO_wil,~] = corr(avg_accuracy', wilcoxon_values, 'Type', 'Pearson')

% figure(4);
% c = cell(10,1);
% c{1,1} = 'gender'; c{2,1} = 'age'; c{3,1} = 'hypertension'; c{4,1} = 'heart.disease';
% c{5,1} = 'ever.married'; c{6,1} = 'work.type'; c{7,1} = 'residence.type'; c{8,1} = 'avg.glucose.level';
% c{9,1} = 'bmi'; c{10,1} = 'smoking.status';
% scatter(avg_accuracy, wilcoxon_values','filled');
% dx = 0.001; dy = 0.001;
% x = avg_accuracy';
% y = wilcoxon_values';
% text(x+dx, y+dy, c);
% xlabel('Accuracy (in %)');
% ylabel('Mann-Whitney values');





