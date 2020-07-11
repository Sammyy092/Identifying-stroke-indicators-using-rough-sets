function pbi = bimodality(in)
    pbi = kurtosis(in, 1, 1) - power(skewness(in, 1, 1), 2);
    
end
