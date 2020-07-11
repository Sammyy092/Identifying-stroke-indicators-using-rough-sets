% %

addpath('./scripts/');


filename = './data/normalised_heart_stroke_dataset.xlsx';
normalized_data = xlsread(filename, 1);

number_of_positive_stroke = sum(normalized_data(:,12) == 1);
number_of_negative_stroke = sum(normalized_data(:,12) == 0);
total_observations = number_of_positive_stroke + number_of_negative_stroke;

% This step is performed for shuffling the dataset
sampledata=datasample(normalized_data,total_observations,'Replace', false');


% % Discretization
% original = 5 4 5
qw = multithresh(sampledata(:,3),7);
age_levels=[0,qw, max(sampledata(:,3))];
quantised_age = discretize(sampledata(:,3), age_levels);

qw1 = multithresh(sampledata(:,9),3);
avgglucose_levels = [0,qw1, max(sampledata(:,9))];
quantised_avgglucose = discretize(sampledata(:,9), avgglucose_levels);

qw2 = multithresh(sampledata(:,10),3);
bmi_levels = [0,qw2, max(sampledata(:,10))];
quantised_bmi = discretize(sampledata(:,10), bmi_levels);


newsampledata = cat(2, sampledata(:,2), quantised_age, sampledata(:,4), sampledata(:,5), sampledata(:,6), sampledata(:,7), sampledata(:,8), quantised_avgglucose, quantised_bmi, sampledata(:,11), sampledata(:,12));


% Save in a TXT file
fileID=fopen('./results/Table3-values.txt','a+');
fprintf(fileID,'The dependence value of the queried attribute w.r.t. gender is: ');
[gamma_att1] =  impact_factor(newsampledata,1,11);
fprintf(fileID,'%f\n\n\n', gamma_att1);



[gamma_att2] =  impact_factor(newsampledata,2,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. age is: ');
fprintf(fileID,'%f\n\n\n', gamma_att2);



[gamma_att3] =  impact_factor(newsampledata,3,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. hyper tension is: ');
fprintf(fileID,'%f\n\n\n', gamma_att3);



[gamma_att4] =  impact_factor(newsampledata,4,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. heart disease is: ');
fprintf(fileID,'%f\n\n\n', gamma_att4);



[gamma_att5] =  impact_factor(newsampledata,5,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. ever marred is: ');
fprintf(fileID,'%f\n\n\n', gamma_att5);


[gamma_att6] =  impact_factor(newsampledata,6,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. work type is: ');
fprintf(fileID,'%f\n\n\n', gamma_att6);



[gamma_att7] =  impact_factor(newsampledata,7,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. residence is: ');
fprintf(fileID,'%f\n\n\n', gamma_att7);



[gamma_att8] =  impact_factor(newsampledata,8,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. average glucose is: ');
fprintf(fileID,'%f\n\n\n', gamma_att8);


[gamma_att9] =  impact_factor(newsampledata,9,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. bmi is: ');
fprintf(fileID,'%f\n\n\n', gamma_att9);


[gamma_att10] =  impact_factor(newsampledata,10,11);
fprintf(fileID,'The dependence value of the queried attribute w.r.t. smoking status is: ');
fprintf(fileID,'%f\n\n\n', gamma_att10);
fclose(fileID);

disp ('Computation complete.');
