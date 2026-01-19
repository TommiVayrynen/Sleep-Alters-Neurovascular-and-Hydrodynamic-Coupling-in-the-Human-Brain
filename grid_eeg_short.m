function grid_eeg_short(namei)

    try
        load(...) % load data.
        frex = logspace(log10(0.01),log10(5),50);
        conv_res = morlet_convolution(eeg,50,frex,8);
        save(sprintf('...mat',namei),'conv_res',"-v7.3")
    catch
        disp('Error')
    end

end






