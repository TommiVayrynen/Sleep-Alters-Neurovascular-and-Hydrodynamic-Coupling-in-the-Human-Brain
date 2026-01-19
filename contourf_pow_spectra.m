
load(...) % load TF maps
addpath('slanCM')
cmap = slanCM('haline',100)
frex = logspace(log10(0.01),log10(5),50);
srate=;

figure;
subplot(141)
contourf([1:size(powa,2)]./srate,frex,powa,100,'LineColor','none')
;set(gca,'YScale','log');colorbar;
caxis([0 .2*10^(-9)])
subplot(142)
contourf([1:size(pown1,2)]./srate,frex,pown1,100,'LineColor','none')
;set(gca,'YScale','log');colorbar;
caxis([0 .2*10^(-9)])
subplot(143)
contourf([1:size(pown2,2)]./srate,frex,pown2,100,'LineColor','none')
;set(gca,'YScale','log');colorbar;
caxis([0 .2*10^(-9)])
colormap(cmap)


load(...) % Load mean powers.
addpath cbrewer % 
cmap=cbrewer('div','RdYlBu',11)
c1=cmap(4,:)*.9
c2=cmap(8,:)*.9
c3=cmap(9,:)*.9
subplot(144)

plot_spectra(frex,colpowa,c1,1)
plot_spectra(frex,colpown1,c2,1)
plot_spectra(frex,colpown2,c3,1)
set(gca,'XScale','log');
y=ylim
ylim([0,y(2)])

for i=1:size(colpowa,1)
        avlf = bandpower(colpowa(i,:)',frex,[0.01 0.08],'psd')
        totpow1(i,:)=avlf;
end
for i=1:size(colpown1,1)
        avlf = bandpower(colpown1(i,:)',frex,[0.01 0.08],'psd')
        totpow2(i,:)=avlf;
end
for i=1:size(colpown2,1)
        avlf = bandpower(colpown2(i,:)',frex,[0.01 0.08],'psd')
        totpow3(i,:)=avlf;
end

figure;
calc_box(totpow1,1,c1,3,1,0,'-',1,1)
calc_box(totpow2,3,c2,3,1,0,'-',1,1)
calc_box(totpow3,5,c3,3,1,0,'-',1,1)
