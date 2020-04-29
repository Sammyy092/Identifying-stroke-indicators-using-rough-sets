Z=cat(2,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10); 
% Z is the KNN results of all the conditional attributes

KNN_table=cell2mat(Z);
KNN_results=mean(SVM_table);

Relevance=[0.0326,0.0849,0.0430,0.0517,0.0360,0.0364,0.0323,0.0438,0.0330,0.0340];    
%Relevance is roughset values for conditional attributes
KNN_cropped = KNN_results;
%KNN_cropped(9) = [];

relevance_cropped = Relevance;
%relevance_cropped(9) = [];

[RHO,~] = corr(KNN_cropped', relevance_cropped', 'Type', 'Pearson')

figure;
a = [1:length(relevance_cropped)]'; b = num2str(a); c = cellstr(b);
scatter(KNN_cropped', relevance_cropped','filled');
dx = 0.001; dy = 0.001;
x = KNN_cropped';
y = relevance_cropped';
text(x+dx, y+dy, c);
xlabel('Ground truth');
ylabel('Relevance');
