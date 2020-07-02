function pbi = bimod_degree_new(in)
% This function calculates the Pearson's bimodal degree of a vector.
% -----------------------------------------------------
pbi = kurtosis(in, 1, 1) - power(skewness(in, 1, 1), 2);



% This line is for calling bimod_degree_new function. 
% Sir soumya can you please help me in describing what is J here. I think maybe it is our dataset
bimod_degree_new(J);
