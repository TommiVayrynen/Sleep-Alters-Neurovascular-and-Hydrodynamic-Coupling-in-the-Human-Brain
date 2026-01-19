function grid_mreg_short(namei)

try
    load(...) % load data
    frex = logspace(log10(0.01),log10(5),50);
    mregvoxels = randperm(68100,3405); % Uniform sampling non repeating
    conv_bold = morlet_convolution(mreg_ts(:,mregvoxels)',10,frex,8);
    conv_res = mean(abs(conv_bold).^2,3);
    save(sprintf('...convmregshort.mat',namei),'conv_res',"-v7.3")
   
catch
    disp('Error')
    
end

end
