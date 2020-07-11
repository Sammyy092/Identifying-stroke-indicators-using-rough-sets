function [gamma_att] =  impact_factor(decision_table , attribute_number , dec_attribute_number)


    % Find the size of the decision table. The variable "tot_len" indicates the number of observations.
    [tot_len,~] = size(decision_table) ;
    
    
    % indisc_att = indiscernibility_values_extraction_for_conditional_attributes
    % indisc_att_modified = indiscernibility_values_extraction_for_decisional_attribute
    
    % Generate the corresponding partitions
    IND_att =  indiscernibility_values_extraction_for_conditional_attributes(decision_table , attribute_number) ;
    IND_decision =  indiscernibility_values_extraction_for_decisional_attribute(decision_table , dec_attribute_number);
    
    
    total = 0;
    for ent = 1:length(IND_att) % We loop for all sets of the partition contained in the cell array.
        A = IND_att{ent,1}; % Corresponding set of the cell array.

        t = 1;
        B = IND_decision{t,1};
            
        Lia = ismember(A,B,'rows');    % Returns a logical "1" if data of A is found in B
            

        total_number_of_elements = length(Lia);
         
        number_of_ones = sum(Lia);
            
            
        percentage_occurence = number_of_ones*(number_of_ones/total_number_of_elements);
            
        total = total + percentage_occurence;            
 
    end
    
    gamma_att = (total/tot_len)*100;
    


end
