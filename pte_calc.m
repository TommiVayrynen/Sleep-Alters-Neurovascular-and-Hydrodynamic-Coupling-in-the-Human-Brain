
function pte_calc(foname,theta)

    addpath('phaseTE')    
    load([foname 'data1.mat'])
    load([foname 'data2.mat'])
    hdata1=hilbert(data1); % compute analytical signals for phase TE
    hdata2=hilbert(data2);
    sig1=hdata1;
    sig2=hdata2;

    for b = 1:size(sig2,2)
        for s = 1:size(sig1,2)
            phase1=angle(sig1(:,s));
            phase2=angle(sig2(:,b));
            if sum(phase1==0)==length(phase1) || sum(phase2==0)==length(phase2)
                pte_all(1,b,s)=nan;
                pte_all(2,b,s)=nan;
               continue
            else
                ptei=phaseTE([phase1';phase2'],theta)); 
                pte_all(1,b,s)=ptei(1,2);
                pte_all(2,b,s)=ptei(2,1);
            end        
        end
    end
    save(sprintf('%s/pte_all.mat',foname),'pte_all')

end