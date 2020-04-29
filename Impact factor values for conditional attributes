function [gamma_att] =  positive_region_modified(decision_table , attribute_number , dec_attribute_number)

% This function outputs the POSITIVE region for an attribute and its
% gamma-value.

% INPUT: 
% (a) decision_table = Array containing the universe. Rows correspond to
% different observations, and columns correspond to characteristics.
% (b) attribute_number = COLUMN number for a particular attribute in the decision
% table to indicate that particular attribute.
% (c) dec_attribute_number = COLUMN number of the decision variable in the
% decision table.

% OUTPUT:
% (b) gamma_att = Gamma value of the particular attribute queried.


    % Find the size of the decision table. The variable "tot_len" indicates the number of observations.
    [tot_len,~] = size(decision_table) ;
    
    % Generate the corresponding partitions
    IND_att =  indisc_att(decision_table , attribute_number) ;
    IND_decision =  indisc_att_modified(decision_table , dec_attribute_number);
    %indisc_att_modified used to extract the rows having the value 1 only

        for ent = 1:length(IND_att) % We loop for all sets of the partition contained in the cell array.
        A = IND_att{ent,1}; % Corresponding set of the cell array.

        %for t = 1:length(IND_decision)  % We check "A" against all sets of the decision partition.
        %% This loop is muted because we are interested only in the poitive values of decision attribute
            t = 1;
            B = IND_decision{t,1};
            
            Lia = ismember(A,B,'rows');    % Returns a logical "1" if data of A is found in B
            
            %temp = any(Lia==0);
            % This is the case when "Lia" is all 1's. That means all elements of A are found in B; which in fact means "positive region".
            %if temp == 0
            %    POS_al = cat(1,POS_al,A);
        %end

            total_number_of_elements = length(Lia);
         
            number_of_ones = sum(Lia);
            
            
            percentage_occurence = number_of_ones*(number_of_ones/total_number_of_elements);
            
            total = total + percentage_occurence;            
 
    end
    
    gamma_att = (total/tot_len)*100;
    


end
