clear clc
mm=dir('easycoco_ambient');
num=length(mm);

%correct positive bin value 
qc=11.9991;
qna=22.993;
qal=26.9839;
qc3=36.0023;
qk=38.9672;
qfe=55.932;
qpb_206=205.976;
qpb_207=206.97;
qpb_208=207.967;

%correct negtive bin value
qno3=61.9938;
qcn=25.9994;
qcl35=34.9641;
qso4=95.9502;
qnacl=57.9574;
qno2=45.9897;
qno=29.9945;
qhso4=96.9546;


MMat=[];
erroridpos=[];
erroridneg=[];
id=[];
ps=[];
pps=[];
z=[];
q=[];
zz=[];
qq=[];

for i=1:(num-2)
    filename=['easycoco_ambient\1 (' num2str(i) ')' '.csv'];
    Mat = csvread(filename, 1, 0);
    [m n]=size(Mat);
    if m==25000
        MMat=[MMat Mat];
        id=[id i];
    end
    i
end
MMatp=MMat;  %the result of the calibration
MMatpcal=MMatp;

for i=2:2:(num-2)*4-1
    MMatpcal(:,i)=0;
end

z_1=[]; z_2=[]; z_3=[]; z_4=[]; z_5=[]; z_6=[]; z_7=[]; z_8=[]; z_9=[];
%pos calibration
[m1 n1]=size(MMat);
for i=1:4:(n1-3)
    z=[];q=[];
    for j=1:(m1-1)
    
        if MMat(j,i)<11.9 && MMat(j+1,i)>11.9   %C
            x1=j;
        end
        if MMat(j,i)<12.1 && MMat(j+1,i)>12.1 
            x2=j+1;
        end
        
        if MMat(j,i)<22.9 && MMat(j+1,i)>22.9 % Na
            x3=j;
        end
        if MMat(j,i)<23.1 && MMat(j+1,i)>23.1
            x4=j+1;
        end
        
        if MMat(j,i)<26.9 && MMat(j+1,i)>26.9 % Al
            x5=j;
        end
        if MMat(j,i)<27.1 && MMat(j+1,i)>27.1 
            x6=j+1;
        end

        if MMat(j,i)<38.9 && MMat(j+1,i)>38.9 % K
            x7=j;
        end
        if MMat(j,i)<39.1 && MMat(j+1,i)>39.1 
            x8=j+1;
        end 
        
        if MMat(j,i)<35.9 && MMat(j+1,i)>35.9 % C3
            x9=j;
        end
        if MMat(j,i)<36.1 && MMat(j+1,i)>36.1 
            x10=j+1;
        end 
        
        if MMat(j,i)<55.85 && MMat(j+1,i)>55.85 % Fe
            x11=j;
        end
        if MMat(j,i)<56.05 && MMat(j+1,i)>56.05
            x12=j+1;
        end 
        
        if MMat(j,i)<207.88 && MMat(j+1,i)>207.88 % Pb_208
            x13=j;
        end
        if MMat(j,i)<208.08 && MMat(j+1,i)>208.08
            x14=j+1;
        end
        
        if MMat(j,i)<205.9 && MMat(j+1,i)>205.9 % Pb_206
            x15=j;
        end
        if MMat(j,i)<206.1 && MMat(j+1,i)>206.1
            x16=j+1;
        end
        
        if MMat(j,i)<206.9 && MMat(j+1,i)>206.9 % Pb_207
            x17=j;
        end
        if MMat(j,i)<207.1 && MMat(j+1,i)>207.1
            x18=j+1;
        end
        
        
    end
        
        [c indexc]=max(MMat(x1:x2,i+1));
        indexc=indexc+x1-1;
        [na indexna]=max(MMat(x3:x4,i+1));
        indexna=indexna+x3-1;
        [al indexal]=max(MMat(x5:x6,i+1));
        indexal=indexal+x5-1;
        [k indexk]=max(MMat(x7:x8,i+1));
        indexk=indexk+x7-1;
        [c3 indexc3]=max(MMat(x9:x10,i+1));
        indexc3=indexc3+x9-1;
        [fe indexfe]=max(MMat(x11:x12,i+1));
        indexfe=indexfe+x11-1;
        [pb_208 indexpb_208]=max(MMat(x13:x14,i+1));
        indexpb_208=indexpb_208+x13-1;
        [pb_206 indexpb_206]=max(MMat(x15:x16,i+1));
        indexpb_206=indexpb_206+x15-1;
        [pb_207 indexpb_207]=max(MMat(x17:x18,i+1));
        indexpb_207=indexpb_207+x17-1;
        
        
        
        %校正值
        z1=MMat(indexc,i);
        if MMat(indexc,i+1)>8 
          z=[z z1];
          q=[q qc];
          z_1=[z_1 z1];
        end
        
        z2=MMat(indexna,i);
        if MMat(indexna,i+1)>8
          z=[z z2];
          q=[q qna];
          z_2=[z_2 z2];
        end 
        
        z3=MMat(indexal,i);
        if MMat(indexal,i+1)>8
           %z=[z z3];
           %q=[q qal];
           z_3=[z_3 z3];
        end
        
        z4=MMat(indexk,i);
        if MMat(indexk,i+1)>8
           z=[z z4];
           q=[q qk];
           z_4=[z_4 z4];
        end
        
        z5=MMat(indexc3,i);
        if MMat(indexc3,i+1)>8
           z=[z z5];
           q=[q qc3];
           z_5=[z_5 z5];
        end
        
        z6=MMat(indexfe,i);
        if MMat(indexfe,i+1)>8
           z=[z z6];
           q=[q qfe];
           z_6=[z_6 z6];
        end

        z7=MMat(indexpb_208,i);
        if MMat(indexpb_208,i+1)>8
           z=[z z7];
           q=[q qpb_208];
           z_7=[z_7 z7];
        end
        
        z8=MMat(indexpb_206,i);
        if MMat(indexpb_206,i+1)>8
           z=[z z8];
           q=[q qpb_206];
           z_8=[z_8 z8];
        end
        
        z9=MMat(indexpb_207,i);
        if MMat(indexpb_207,i+1)>8
           z=[z z9];
           q=[q qpb_207];
           z_9=[z_9 z9];
        end
        
        [aa bb]=size(q);
       if bb>4
        p=polyfit(z,q,1);
        ps=[ps p];
        
        %calibration calculation
        for j=1:m1
            MMatp(j,i)=p(1)*MMat(j,i)+p(2);
        end
        
        for j=1:m1
            posres=abs(MMat(:,i)-MMatp(j,i));
            [a b]=min(posres);
            MMatp(j,i)=MMat(b,i);
        end
       end
       
       if bb>4
           for j=1:m1
               jj=j;
               
               while MMatp(j,i)<MMatpcal(jj,i)
                   jj=jj-1;
               end
               while MMatp(j,i)>MMatpcal(jj,i)
                   jj=jj+1;
               end
               
               MMatpcal(jj,i+1)=MMatpcal(jj,i+1)+MMatp(j,i+1);
           end
       end
       
        %记录正离子采点不足颗粒ID       
        if bb<5
            iddpos=(i-1)/4+1;
            erroridpos=[erroridpos iddpos];
        end 
            
end
disp('pos finshed!')

zz_1=[]; zz_2=[]; zz_3=[]; zz_4=[]; zz_5=[]; zz_6=[]; zz_7=[]; zz_8=[];
%neg calibration 
for i=3:4:(n1-1)
    zz=[]; qq=[];
    for j=1:(m1-1)
        
        if MMat(j,i)<61.9 && MMat(j+1,i)>61.9   %no3
            xx1=j;
        end
        if MMat(j,i)<62.1 && MMat(j+1,i)>62.1
            xx2=j+1;
        end
        
        if MMat(j,i)<25.9 && MMat(j+1,i)>25.9   %cn
            xx3=j;
        end
        if MMat(j,i)<26.1 && MMat(j+1,i)>26.1
            xx4=j+1;
        end
        
        if MMat(j,i)<34.9 && MMat(j+1,i)>34.9  %cl35
            xx5=j;
        end
        if MMat(j,i)<35.1 && MMat(j+1,i)>35.1
            xx6=j+1;
        end
        
        if MMat(j,i)<95.85 && MMat(j+1,i)>95.85 %so4
            xx7=j;
        end
        if MMat(j,i)<96.05 && MMat(j+1,i)>96.05
            xx8=j+1;
        end
        
        if MMat(j,i)<57.85 && MMat(j+1,i)>57.85 %nacl
            xx9=j;
        end
        if MMat(j,i)<58.05 && MMat(j+1,i)>58.05
            xx10=j+1;
        end
        
        if MMat(j,i)<45.9 && MMat(j+1,i)>45.9   %no2
            xx11=j;
        end
        if MMat(j,i)<46.1 && MMat(j+1,i)>46.1
            xx12=j+1;
        end
        
        if MMat(j,i)<29.9 && MMat(j+1,i)>29.9  %no
            xx13=j;
        end
        if MMat(j,i)<30.1 && MMat(j+1,i)>30.1
            xx14=j+1;
        end
        
        if MMat(j,i)<96.85 && MMat(j+1,i)>96.85  %hso4
            xx15=j;
        end
        if MMat(j,i)<97.05 && MMat(j+1,i)>97.05
            xx16=j+1;
        end

    end
    
    %校正值
    [no3 indexno3]=max(MMat(xx1:xx2,i+1));
    indexno3=indexno3+xx1-1;
    [cn indexcn]=max(MMat(xx3:xx4,i+1));
    indexcn=indexcn+xx3-1;
    [cl35 indexcl35]=max(MMat(xx5:xx6,i+1));
    indexcl35=indexcl35+xx5-1;
    [so4 indexso4]=max(MMat(xx7:xx8,i+1));
    indexso4=indexso4+xx7-1;
    [nacl indexnacl]=max(MMat(xx9:xx10,i+1));
    indexnacl=indexnacl+xx9-1;
    [no2 indexno2]=max(MMat(xx11:xx12,i+1));
    indexno2=indexno2+xx11-1;
    [no indexno]=max(MMat(xx13:xx14,i+1));
    indexno=indexno+xx13-1;
    [hso4 indexhso4]=max(MMat(xx15:xx16,i+1));
    indexhso4=indexhso4+xx15-1;
    
    zz1=MMat(indexno3,i);
    if MMat(indexno3,i+1)>8
      zz=[zz zz1];
      qq=[qq qno3];
      zz_1=[zz_1 zz1];
    end
    
    zz2=MMat(indexcn,i);
    if MMat(indexcn,i+1)>8
      zz=[zz zz2];
      qq=[qq qcn];
      zz_2=[zz_2 zz2];
    end

    zz3=MMat(indexcl35,i);
    if MMat(indexcl35,i+1)>8
        zz=[zz zz3];
        qq=[qq qcl35];
        zz_3=[zz_3 zz3];
    end
    
    zz4=MMat(indexso4,i);
    if MMat(indexso4,i+1)>8
        zz=[zz zz4];
        qq=[qq qso4];
        zz_4=[zz_4 zz4];
    end
    
    zz5=MMat(indexnacl,i);
    if MMat(indexnacl,i+1)>8
        %zz=[zz zz5];
        %qq=[qq qnacl];
        zz_5=[zz_5 zz5];
    end
    
    zz6=MMat(indexno2,i);
    if MMat(indexno2,i+1)>8
        zz=[zz zz6];
        qq=[qq qno2];
        zz_6=[zz_6 zz6];
    end

    zz7=MMat(indexno,i);
    if MMat(indexno,i+1)>8
        zz=[zz zz7];
        qq=[qq qno];
        zz_7=[zz_7 zz7];
    end 
    
    zz8=MMat(indexhso4,i);
    if MMat(indexhso4,i+1)>8
        zz=[zz zz8];
        qq=[qq qhso4];
        zz_8=[zz_8 zz8];
    end
    
        [aa bb]=size(qq);
       if bb>4
        pp=polyfit(zz,qq,1);
        pps=[pps pp];
        
        %calibration calculation
        for j=1:m1
            MMatp(j,i)=pp(1)*MMat(j,i)+pp(2);
        end
        
        for j=1:m1
            negres=abs(MMat(:,i)-MMatp(j,i));
            [aneg bneg]=min(negres);
            MMatp(j,i)=MMat(bneg,i);
        end
       end
       
      if bb>4
           for j=1:m1
               jj=j;
               
               while MMatp(j,i)<MMatpcal(jj,i)
                   jj=jj-1;
               end
               while MMatp(j,i)>MMatpcal(jj,i)
                   jj=jj+1;
               end
               
               MMatpcal(jj,i+1)=MMatpcal(jj,i+1)+MMatp(j,i+1);
           end
       end
       
        %记录负离子采点不足颗粒ID       
        if bb<5
            iddneg=(i-3)/4+1;
            erroridneg=[erroridneg iddneg];
        end  

end
disp('neg finshed!')


erroridtol=[erroridpos, erroridneg];
erroridtol=unique(erroridtol);

[errlenx errleny]=size(erroridtol);
for i=1:errleny
    erroridtol2(4*i-3)=erroridtol(i)*4-3;
    erroridtol2(4*i-2)=erroridtol(i)*4-2;
    erroridtol2(4*i-1)=erroridtol(i)*4-1;
    erroridtol2(4*i)=erroridtol(i)*4;
end


MMatpcal(:,erroridtol2)=[];


MMatpcal1=MMatpcal;
MMatpcal1(18605:25000,:)=[];
[lenMMx lenMMy]=size(MMatpcal1);
lenMMy2=lenMMy/4;

for i=1:lenMMx
    for j=1:2:(lenMMy-1)
        MMatpcal1(i,j)=round(MMatpcal1(i,j));
    end
end

MMatpcal_artpos1=MMatpcal1;
MMatpcal_artneg1=MMatpcal1;

clepos=[]; cleneg=[];
for i=1:lenMMy2
    cle1=4*i-3;
    cle2=4*i-2;
    cle3=4*i-1;
    cle4=4*i;
    clepos=[clepos cle1 cle2];
    cleneg=[cleneg cle3 cle4]; 
end

MMatpcal_artpos1(:,cleneg)=[];
MMatpcal_artneg1(:,clepos)=[];



MMatpcal_artpos=MMatpcal_artpos1;
MMatpcal_artneg=MMatpcal_artneg1;


clearipos=[]; clearineg=[];
%for j=1:2:(lenMMy2*2-1)
    for i=1:(lenMMx-1)
        if MMatpcal_artpos(i,1)==MMatpcal_artpos(i+1,1)
            MMatpcal_artpos(i+1,2:2:lenMMy2*2)=MMatpcal_artpos(i+1,2:2:lenMMy2*2)+MMatpcal_artpos(i,2:2:lenMMy2*2);
            clearipos=[clearipos i];
        end
        if MMatpcal_artneg(i,1)==MMatpcal_artneg(i+1,1)
            MMatpcal_artneg(i+1,2:2:lenMMy2*2)=MMatpcal_artneg(i+1,2:2:lenMMy2*2)+MMatpcal_artneg(i,2:2:lenMMy2*2);
            clearineg=[clearineg i];
        end
    end
%end

MMatpcal_artpos(clearipos,:)=[];
MMatpcal_artneg(clearineg,:)=[];

clcl=1:2:(lenMMy2*2-1);

MMatpcal_artpos(:,clcl)=[];
MMatpcal_artneg(:,clcl)=[];

MMatpcal_artpos=MMatpcal_artpos';
MMatpcal_artneg=MMatpcal_artneg';

MMatpcal_art=[MMatpcal_artneg MMatpcal_artpos];



MASS=MMatpcal_art;



disp('MASS finshed!')

Type= 'Area';
MaxIteration=100;
Polarity = 2;    
Learning = 0.05;    
Vigilance = 0.7;
StopCond = {'Iteration',20};




Lambda = Learning / (1-Learning);


    



RandomSeed = [0.69231654672860;0.16459547092863;0.56763156186750;0.36088624312485;0.03708781469184;...
	      0.38543046292857;0.16532903544109;0.37524412910711;0.72974796132891;0.45343661042044;0.85958193223649;...
	      0.56853924287677;0.98482523982115;0.37423162154931;0.37145836075025;0.94990815571897;0.97740762596239;...
	      0.74276094740486;0.49582125124247;0.41567584477442;0.07774700965716;0.32992450636972;0.94287569097460;...
	      0.09063420445376;0.30912124362840;0.55178476374198;0.03502431542736;0.00177150801234;0.98539961256330;...
	      0.82294171861387;0.45855695113763;0.97099492768831;0.00000000000000;0.00000000000000;0.00000079616453];

rand('state', RandomSeed);

NumSpectra = lenMMy2;

if Polarity == 2
    AreaMatrix = MASS;
    AreaMatrix(:,292)=0;
   

    NegIdx = 1:252;
    PosIdx = 253:504;
    for i = 1:NumSpectra
        nn = norm(AreaMatrix(i,NegIdx));
        pn = norm(AreaMatrix(i,PosIdx));
        if nn && pn
            AreaMatrix(i,NegIdx) = AreaMatrix(i,NegIdx) / nn / sqrt(2);
            AreaMatrix(i,PosIdx) = AreaMatrix(i,PosIdx) / pn / sqrt(2);
        elseif pn
            AreaMatrix(i,PosIdx) = AreaMatrix(i,PosIdx) / pn;
        elseif nn
            AreaMatrix(i,NegIdx) = AreaMatrix(i,NegIdx) / nn;
        end
    end
else
    AreaMatrix = MASS;
    for i = 1:NumSpectra
        n = norm(AreaMatrix(i,:));
        if n
            AreaMatrix(i,:) = AreaMatrix(i,:) / n;
        end
    end
end


WM = AreaMatrix(1,:);

Iteration = 1;
Neuron = zeros(NumSpectra,1);
Proximity = zeros(NumSpectra,1);

WM = WM';   

while 1
 disp(sprintf('Iteration %i',Iteration));
    
    LastNeuron = Neuron;
    
    for i = randperm(NumSpectra)
        [Proximity(i), Neuron(i)] = max(AreaMatrix(i,:) * WM);
        
        if Proximity(i) >= Vigilance
                WM(:,Neuron(i)) = WM(:,Neuron(i)) +AreaMatrix(i,:)' * Lambda;                 
                WM(:,Neuron(i)) = WM(:,Neuron(i))/norm(WM(:,Neuron(i)));            
        else
            WM = [WM'; AreaMatrix(i,:)]';
            Neuron(i) = size(WM,2);
        end
    end
      [C,~,IB] = intersect(Neuron,1:size(WM,2));
  WM = WM(:,IB);
  
  n = zeros(size(Neuron));
  for i = 1:length(C)
    idx = find(Neuron == C(i));
    n(idx) = i;
  end
  Neuron = n;
    FracChange1(Iteration) = sum(Neuron ~= LastNeuron); 
    
    Iteration = Iteration + 1;
    if Iteration>=3
        if FracChange1(Iteration-1)==0 && FracChange1(Iteration-2) == 0
            break
        else
            FracChange(Iteration-1)=FracChange1(Iteration-1)/FracChange1(Iteration-2);
        end
    end
    
    if Iteration>=6
        switch StopCond{1}
            case 'Proximity'
                if min(Proximity) >= Vigilance
                    break;
                end
            case 'Iteration'
                if Iteration >= StopCond{2}
                    break;
                end
            case 'FracChange'
                if FracChange(Iteration-1) <= StopCond{2} && FracChange(Iteration-1) >= StopCond{3}...
                        && FracChange(Iteration-2) <= StopCond{2} && FracChange(Iteration-2) >= StopCond{3}...
                        && FracChange(Iteration-3) <= StopCond{2} && FracChange(Iteration-3) >= StopCond{3}...
%                         && FracChange(Iteration-4) <= StopCond{2} && FracChange(Iteration-4) >= StopCond{3}
                    break;
                end
               if Iteration >= 26
                  break;
               end
        end
    end
    
    if Iteration >= MaxIteration
        warning('Reached MaxIteration');
        break
    end
end

[SortNeuron, SortIdx] = sort(Neuron);
NumNeuron = size(WM,2);
PIDCell   = cell(NumNeuron,1);
PIDCount  = zeros(NumNeuron,1);
for i = 1:NumNeuron;
    Idx = find(SortNeuron==i);
    PIDCount(i) = length(Idx);
    PIDCell{i} = MASS(SortIdx(Idx),:);
end

[~, SortIdx] = sort(PIDCount);
SortIdx = SortIdx(end:-1:1);
PaiXu = SortIdx;
PIDCount = PIDCount(SortIdx);
PIDCell = PIDCell(SortIdx);

for i=1:NumNeuron
    PIDCellave(i,:)=mean(PIDCell{i});
end
    

for l = 1:length(PaiXu)
    WM1(:,l)=WM(:,PaiXu(l));
end
OutWM = WM1';

xlswrite('PIDCellave.xlsx',PIDCellave);

[ppa ppb]=size(PIDCellave);

PIDCellave_rel=zeros(ppa,ppb);

for i=1:ppa
    tolneg=sum(PIDCellave(i,1:ppb/2));
    tolpos=sum(PIDCellave(i,(ppb/2+1):ppb));
    for j=1:(ppb/2)
        PIDCellave_rel(i,j)=PIDCellave(i,j)/tolneg;
    end
    for j=(ppb/2+1):ppb
        PIDCellave_rel(i,j)=PIDCellave(i,j)/tolpos;
    end
end

xlswrite('PIDCellave_rel.xlsx',PIDCellave_rel)











































