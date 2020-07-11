function [IND_att] =  indiscernibility_values_extraction_for_conditional_attributes(decision_table , attribute_number)


    [size_table,~]=size(decision_table);
     

    att = decision_table(:,attribute_number);
    
    [uni_att,ia_att,ic_att] = unique(att,'sorted');  
    IND_att = cell(length(uni_att),1);
  
    for t = 1:size_table
        temp = ic_att(t,1);
        IND_att{temp,1} = cat(1,IND_att{temp,1},t);
       
    end
    

end
