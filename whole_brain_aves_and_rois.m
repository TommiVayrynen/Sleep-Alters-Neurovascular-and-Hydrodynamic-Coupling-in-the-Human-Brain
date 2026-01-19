%% Whole brain averages

load('../mean_dpte.mat') % Load data
addpath cbrewer 
cmap=cbrewer('div','RdYlBu',11)
c1=cmap(4,:)*.9
c2=cmap(8,:)*.9
c3=cmap(9,:)*.9


figure;
subplot(311);hold on;
wdth = .5
% water-eeg|bold
calc_box(mw,1,c1,3,wdth,1,'-',1)
calc_box(mn1,2,c2,3,wdth,1,'-',1)
calc_box(mn2,3,c3,3,wdth,1,'-',1)
axes_defaults
ylim([-3.5 -0.5])
xlim([-.4 .2])
grid on
set(gca,'YGrid',0)
xticks([-.4:.1:.2])

subplot(312);hold on;
wdth = .5
 % water-eeg|bold
calc_box(mw2,1,c1,3,wdth,1,'-',1)
calc_box(mn12,2,c2,3,wdth,1,'-',1)
calc_box(mn22,3,c3,3,wdth,1,'-',1)
axes_defaults
ylim([-3.5 -0.5])
xlim([-.7 .5])
grid on
set(gca,'YGrid',0)
xticks([-.8:.2:.6])

subplot(313);hold on;
wdth = .5
% water-eeg|bold
calc_box(mw3,1,c1,3,wdth,1,'-',1)
calc_box(mn13,2,c2,3,wdth,1,'-',1)
calc_box(mn23,3,c3,3,wdth,1,'-',1)
axes_defaults
ylim([-3.5 -0.5])
xlim([-.7 .5])
grid on
set(gca,'YGrid',0)
xticks([-.8:.2:.6])



%% Calc ROI metrics

dptew=niftiread('../EM_dpte_w_3mm_all_subj.nii');
dpten1=niftiread('../EM_dpte_n1_3mm_all_subj.nii');
dpten2=niftiread('../EM_dpte_n2_3mm_all_subj.nii');
mask=niftiread('.../mni_label_3mm.nii.gz'); % Load ROI
new_order = [3,6,5,8,2,1,7,4,9];

figure;
n=0;
for m=1:max(mask(:))
    n=n+1;
    maski=logical(mask==new_order(m));
    v_list=[];
    for x = 1:size(maski,1)
        [y,z]=find(squeeze(maski(x,:,:)));
        if ~isempty(y)
            xcol=repmat(x,length(y),1);
            v_list(end+1:end+length(y),:)=[xcol,y,z];
        end
    end

    masked = dptew;
    mreg_ts = zeros(length(v_list),size(masked,4));
    for j = 1:size(v_list,1)
        mreg_ts(j,:)=masked(v_list(j,1),v_list(j,2),v_list(j,3),:);
    end
    mreg_ts = mreg_ts';
    mw = mean(mreg_ts,2,'omitnan');
    
    masked = dpten1;
    mreg_ts = zeros(length(v_list),size(masked,4));
    for j = 1:size(v_list,1)
        mreg_ts(j,:)=masked(v_list(j,1),v_list(j,2),v_list(j,3),:);
    end
    mreg_ts = mreg_ts';
    mn1 = mean(mreg_ts,2,'omitnan');
    
    masked = dpten2;
    mreg_ts = zeros(length(v_list),size(masked,4));
    for j = 1:size(v_list,1)
        mreg_ts(j,:)=masked(v_list(j,1),v_list(j,2),v_list(j,3),:);
    end
    mreg_ts = mreg_ts';
    mn2 = mean(mreg_ts,2,'omitnan');
    
    
    ;hold on;
    wdth = .4
    calc_box(mw,(2*n-1),c1,2,wdth,1,'-',1)
    calc_box(mn1,(2*n-1)+.5,c2,2,wdth,1,'-',1)
    calc_box(mn2,(2*n-1)+1,c3,2,wdth,1,'-',1)
    axes_defaults
    xlim([-.4 .4])
    grid on
    set(gca,'YGrid',0)
    xticks([-.4:.1:.4])
    yticks(sort([-2*[1:9]+.5]))

end

%% Calc ROI metrics

dptew=niftiread('.../NM_h2o_dpte_w_3mm_all_subj.nii');
dpten1=niftiread('.../NM_h2o_dpte_n1_3mm_all_subj.nii');
dpten2=niftiread('.../NM_h2o_dpte_n2_3mm_all_subj.nii');
new_order = [3,6,5,8,2,1,7,4,9];
mask=niftiread('.../mni_label_3mm.nii.gz');

figure;
n=0;
for m=1:max(mask(:))
    n=n+1;
    maski=logical(mask==new_order(m));
    v_list=[];
    for x = 1:size(maski,1)
        [y,z]=find(squeeze(maski(x,:,:)));
        if ~isempty(y)
            xcol=repmat(x,length(y),1);
            v_list(end+1:end+length(y),:)=[xcol,y,z];
        end
    end

    masked = dptew;
    mreg_ts = zeros(length(v_list),size(masked,4));
    for j = 1:size(v_list,1)
        mreg_ts(j,:)=masked(v_list(j,1),v_list(j,2),v_list(j,3),:);
    end
    mreg_ts = mreg_ts';
    mw = mean(mreg_ts,2,'omitnan');
    
    masked = dpten1;
    mreg_ts = zeros(length(v_list),size(masked,4));
    for j = 1:size(v_list,1)
        mreg_ts(j,:)=masked(v_list(j,1),v_list(j,2),v_list(j,3),:);
    end
    mreg_ts = mreg_ts';
    mn1 = mean(mreg_ts,2,'omitnan');
    
    masked = dpten2;
    mreg_ts = zeros(length(v_list),size(masked,4));
    for j = 1:size(v_list,1)
        mreg_ts(j,:)=masked(v_list(j,1),v_list(j,2),v_list(j,3),:);
    end
    mreg_ts = mreg_ts';
    mn2 = mean(mreg_ts,2,'omitnan');

    ;hold on;
    wdth = .4
    calc_box(mw,(2*n-1),c1,2,wdth,1,'-',1)
    calc_box(mn1,(2*n-1)+.5,c2,2,wdth,1,'-',1)
    calc_box(mn2,(2*n-1)+1,c3,2,wdth,1,'-',1)
    axes_defaults
    xlim([-.6 .6])
    grid on
    set(gca,'YGrid',0)
    xticks([-.6:.1:.6])
    yticks(sort([-2*[1:9]+.5]))
    
end