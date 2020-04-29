lf_files = [];
 CovMat=cov(comb_channel);       % exclude the last column calculating the covariance matrix  
 % comb_channel here is dataset including conditional attribute, i will update after your response sir
    check_nan = isnan(CovMat);
    check_nan_vc = check_nan(:);    
    isthere = length(find(check_nan_vc==1));
     [Ve,De] = eig(CovMat);      % calculating the eigen values
        p1=Ve(:,10);
        lf_ind = abs(p1)';
        lf_files = cat(1,lf_files,lf_ind);    
        mv=lf_files
% Saving the results
save('loading_1D.mat','mv');
