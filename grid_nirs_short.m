function grid_nirs_short(namei)

try
    load(..) % Load NIRS
    frex = logspace(log10(0.01),log10(5),50);
    conv_res = morlet_convolution(nirs,100,frex,8);
    save(sprintf('....mat',namei),'conv_res',"-v7.3")
   
catch
    disp('Error')
end

end


