%This code provides the KNN results for each conditional attribute. 

sampledata=datasample(NormalizedDataa,17443,'Replace', false');
%17443 is the percentage of data from original dataset. As for our research we divided the dataset into fraction from 10% to 100%. 17743 is 60% of 29073 which is the original siz of dataset

% Creating the random dataset having the rows with equal number of 0's and 1's in decsion attribute
lastcoulumn=table2array(sampledata(:,11));
NormalizedDatanoo=sampledata(lastcoulumn==0,:);
NormalizedDatayess=sampledata(lastcoulumn==1,:);
[no_length, ~] = size(NormalizedDatanoo)
[yes_length, ~] = size(NormalizedDatayess)
total_length=yes_length+yes_length;

%Setting training and testing limits i.e 80% and 20%
a=int16(total_length*80/100);
test=int16(a+1);

for u=1:10
for v=1:5000    
y=datasample(NormalizedDatanoo,yes_length,'Replace', false');
newtable=[y;NormalizedDatayess];
z=datasample(newtable,yes_length+yes_length,'Replace', false');
% z is a new dataset having equal number of 1's and 0's in the decision attribute
X_train = z(1:a, u);
Y_train = z(1:a, 11);
X_test = z(test:total_length, u);
Y_test = z(test:total_length, 11);
KNNModel = fitcknn(X_train, Y_train);
[label, score] = predict(KNNModel, X_test);

accuracy = 100 - (sum(abs(label-table2array(Y_test)))/length(table2array(Y_test)))*100;

disp(accuracy);
fname = sprintf ( '%s %i', 'A', u );
fileID=fopen(fname,'a+');
fprintf(fileID,'%f\n', accuracy);
fclose(fileID);
%saving the results for all columns in seperate files names starting from A1 to A10
end
end
