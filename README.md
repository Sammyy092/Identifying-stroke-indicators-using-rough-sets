## Identifying Stroke  Indicators Using Rough Sets

With the spirit of reproducible research, this repository contains all the codes required to produce the results in the manuscript: 

> Pathan, M. S., Zhang, J., John, D., Nag, A. and Dev, S.(2020). Forecasting Precipitable Water Vapor Using LSTMs, under review. 


All codes are written in `MATLAB`.

### Code

+ `./Figure3.m`: Computes the impact of the dataset size on the correlation value (b/t impact score and accuracy).
+ `./Table2_Figure1.m`: Computes the performance of the different individual features of electronic health records for detecting stroke.
+ `./Table3.m`: Computes the (our proposed) impact factor scores for the different individual features of electronic health records.
+ `./Table4_Figure2.m`: Computes the benchmarking scores and scatter-plots for the different benchmarking approaches.
+ `./data/`: This folder contains our input data.
+ `./results/`: This folder will save all the results.
+ `./scripts/`: This folder contains helper `.m` files that are necessary for the computation of the different results in the manuscript.

These `.m` files use the following user-defined helper scripts.

#### Scripts
+ `bimodality.m`: Computes the bimodality score of a feature vector.
+ `find_scores.m`: Computes the precision, recall, f-score and accuracy values.
+ `impact_factor.m`: Computes the impact factor scores
+ `impactfactor_from_data.m`: Computes the impact factor from the data matrix. The script `impact_factor.m` is a subset of this file.
+ `indiscernibility_values_extraction_for_conditional_attributes.m`: Computes the indiscernibility values for the conditional attributes.
+ `indiscernibility_values_extraction_for_decisional_attribute.m`: Computes the indiscernibility values for decisional attribute.
+ `l_factors.m`: Computes the loading factor scores for the different features from the input data. 