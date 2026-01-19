
d = dir(..) % Data folder
fnames={d.name}';
seed= [30,60,30]+1; % Seed voxel
maxlag=100;
v_list=load(..); % Coordinate list.

for i=1:length(fnames)

    rmax_all=zeros(1,68100);
    lags_all=zeros(1,68100);
    try
        load(['..' '/mreg_ts.mat']); % Load VLF filtered data
    catch
        continue
    end

    seed_ind=sum([v_list(:,1)==seed(1),v_list(:,2)==seed(2),v_list(:,3)==seed(3)],2);
    seed_ind=find(seed_ind==3);
    seed_ts=mreg_ts(:,seed_ind); 

    for s = 1:size(mreg_ts,2)
        [r,lag]=xcorr(seed_ts,mreg_ts(:,s),maxlag,'coeff'); % Calculate cross-correlation.
        [rmax,maxind]=max(r); 
        rmax_all(s)=rmax;
        lags_all(s)=lag(maxind)/10; % Lag corresponding to max. correlation.
    end
    
    save(['..' fnames{i} '/xcorr_lags.mat'],'lags_all')
    save(['..' fnames{i} '/xcorr_corr.mat'],'rmax_all')

end
