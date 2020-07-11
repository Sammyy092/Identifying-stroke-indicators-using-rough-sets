function [precision, recall, fscore, accuracy] =  find_scores(prediction_array, ground_truth_array)

    no_of_obs = length(prediction_array);
    
    TP=0;FP=0;TN=0;FN=0;
    for i=1:no_of_obs

        if(ground_truth_array(i)==1 && prediction_array(i)==1)
            TP=TP+1;
        elseif(ground_truth_array(i)==0 && prediction_array(i)==1)
            FP=FP+1;
        elseif(ground_truth_array(i)==0 && prediction_array(i)==0)
            TN=TN+1;
        else
            FN=FN+1;
        end

    end


    precision = TP/(TP+FP);
    recall = TP/(TP+FN);
    fscore = (2*TP)/(2*TP+FP+FN);
    accuracy = (TP+TN)/(TP+TN+FP+FN);
    
end
