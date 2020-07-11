function [IND_att_positive] =  indiscernibility_values_extraction_for_decisional_attribute(decision_table , attribute_number)

    [size_table,~]=size(decision_table);

    att = decision_table(:,attribute_number);
    
    
    [uni_att,ia_att,ic_att] = unique(att,'sorted');  
    IND_att = cell(1,1);
  
    for t = 1:size_table
        temp = ic_att(t,1);
        if (temp == 2)
            IND_att{1,1} = cat(1,IND_att{1,1},t);
        end
    end
    
    IND_att_positive = IND_att;
    

end
