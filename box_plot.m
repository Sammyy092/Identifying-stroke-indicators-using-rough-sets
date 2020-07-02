Y=cat(2,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10);

X=cell2mat(Y);
%X=['gender';'age';'hypertension';'heart.disease'; 'ever.married';'work.type';'residence.type'; 'avg_glucose.level'; 'bmi'; 'smoking.status'];

boxplot(X);
