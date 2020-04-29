%  rough-set problem.

addpath('./helperScripts/');
addpath('./preComputed/');
addpath('./roughSetScripts/');

sampledata = table2array(sampledata);
%% sample data is the random sample taken from the real dataset. This code is for the 90% of the random sample taken from the real dataset.
%%As we have taken the rough-set values for fractions of the data from 10% to 100%.  

% % Discritization
qw = multithresh(sampledata(:,2),4);
%age_levels=[25.2471, 39.6471, 52.9176, 67.0353];
age_levels=[0,qw, max(sampledata(:,2))];
quantised_age = discretize(sampledata(:,2), age_levels);

qw1 = multithresh(sampledata(:,8),5);
%avgglucose_levels = [0,50,55,70,80,85,100,110,130,230];
avgglucose_levels = [0,qw1, max(sampledata(:,8))];
quantised_avgglucose = discretize(sampledata(:,8), avgglucose_levels);

qw2 = multithresh(sampledata(:,9),6);
%bmi_levels = [10, 20,25,28,32,40,50,60,70];
bmi_levels = [0,qw2, max(sampledata(:,9))];
quantised_bmi = discretize(sampledata(:,9), bmi_levels);


newsampledata = cat(2, sampledata(:,1), quantised_age, sampledata(:,3), sampledata(:,4), sampledata(:,5), sampledata(:,6), sampledata(:,7), quantised_avgglucose, quantised_bmi, sampledata(:,10), sampledata(:,11));


[gamma_att1] =  positive_region_modified(newsampledata,1,11);
disp ('The dependence value of the queried attribute w.r.t. gender is:');
disp (gamma_att1);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att1);
fclose(fileID);
[gamma_att2] =  positive_region_modified(newsampledata,2,11);
disp ('The dependence value of the queried attribute w.r.t. age is:');
disp (gamma_att2);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att2);
fclose(fileID);
[gamma_att3] =  positive_region_modified(newsampledata,3,11);
disp ('The dependence value of the queried attribute w.r.t. hyper tension is:');
disp (gamma_att3);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att3);
fclose(fileID);
[gamma_att4] =  positive_region_modified(newsampledata,4,11);
disp ('The dependence value of the queried attribute w.r.t. heart disease is:');
disp (gamma_att4);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att4);
fclose(fileID);
[gamma_att5] =  positive_region_modified(newsampledata,5,11);
disp ('The dependence value of the queried attribute w.r.t. ever marred is:');
disp (gamma_att5);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att5);
fclose(fileID);
[gamma_att6] =  positive_region_modified(newsampledata,6,11);
disp ('The dependence value of the queried attribute w.r.t. work type is:');
disp (gamma_att6);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att6);
fclose(fileID);
[gamma_att7] =  positive_region_modified(newsampledata,7,11);
disp ('The dependence value of the queried attribute w.r.t. residence is:');
disp (gamma_att7);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att7);
fclose(fileID);
[gamma_att8] =  positive_region_modified(newsampledata,8,11);
disp ('The dependence value of the queried attribute w.r.t. average glucose is:');
disp (gamma_att8);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att8);
fclose(fileID);
[gamma_att9] =  positive_region_modified(newsampledata,9,11);
disp ('The dependence value of the queried attribute w.r.t. bmi is:');
disp (gamma_att9);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att9);
fclose(fileID);
[gamma_att10] =  positive_region_modified(newsampledata,10,11);
disp ('The dependence value of the queried attribute w.r.t. smoking status is:');
disp (gamma_att10);
fileID=fopen('roughsets90%.txt','a+');
fprintf(fileID,'%f\n', gamma_att10);
fclose(fileID);

%% --------------------------------------------------------
