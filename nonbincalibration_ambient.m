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
%Add pos
qc6h5=77.0348;
qcacl=76.9336;
qnah2o3=77.0203;

qvo=66.9353;
qc5h7=67.0566;

qc7h5=89.0366;
qna2bo2=88.9744;

qc8h6=102.04;
qcano3=101.957;

%correct negtive bin value
qno3=61.9938;
qcn=25.9994;
qcl35=34.9641;
qso4=95.9502;
qnacl=57.9574;
qno2=45.9897;
qno=29.9945;
qhso4=96.9546;
%Add neg
qso3=79.9547;
qc6h8=80.058;

qc7h=85.0029;
qnano3=84.9724;

qkcl2=108.899;
qc9h=109.011;
qnabo22=108.985;


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
        
        if MMat(j,i)<66.9 && MMat(j+1,i)>66.9   %67 VO C5H7
            x19=j;
        end
        if MMat(j,i)<67.1 && MMat(j+1,i)>67.1
            x20=j+1;
        end
        
        if MMat(j,i)<76.9 && MMat(j+1,i)>76.9   %77 C6H5 Na(H2O)3 CaCl
            x21=j;
        end
        if MMat(j,i)<77.1 && MMat(j+1,i)>77.1
            x22=j+1;
        end
        
        if MMat(j,i)<88.9 && MMat(j+1,i)>88.9   %89 C7H5 Na2BO2
            x23=j;
        end
        if MMat(j,i)<89.1 && MMat(j+1,i)>89.1
            x24=j+1;
        end
        
        if MMat(j,i)<101.9 && MMat(j+1,i)>101.9 %102 C8H6 CaNO3
            x25=j;
        end
        if MMat(j,i)<102.1 && MMat(j+1,i)>102.1
            x26=j+1;
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
        %p=polyfit(z,q,1);
        p=[1 0];
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
        %pp=polyfit(zz,qq,1);
        pp=[1 0];
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

[m2 n2]=size(erroridpos);
for i=1:n2
    MMatpcal(:,(erroridpos(i)-1)*4+2)=0;
    MMatpcal(:,erroridpos(i)*4)=0;
end

[m3 n3]=size(erroridneg);
for i=1:n3
    MMatpcal(:,(erroridneg(i)-1)*4+2)=0;
    MMatpcal(:,erroridneg(i)*4)=0;
end

yxtotal=(num-2)-n2-n3+sum(ismember(erroridpos,erroridneg))

aveMMatpcal(:,1)=MMatpcal(:,1);
aveMMatpcal(:,2)=0;
aveMMatpcal(:,3)=MMatpcal(:,3);
aveMMatpcal(:,4)=0;

for i=1:(num-2)
    aveMMatpcal(:,2)=aveMMatpcal(:,2)+MMatpcal(:,i*4-2);
    aveMMatpcal(:,4)=aveMMatpcal(:,4)+MMatpcal(:,i*4);
end

aveMMatpcal(:,2)=aveMMatpcal(:,2)/(num-2-n2);
aveMMatpcal(:,4)=aveMMatpcal(:,4)/(num-2-n3);

xlswrite('aveMMatpcal_ambient.xlsx',aveMMatpcal);
xlswrite('positive_slope.xlsx',ps);
xlswrite('negative_slope.xlsx',pps);

%fid=fopen('calibration result_ambient.txt','wt');
%[row col]=size(MMatpcal);
%for i=1:row
%    for j=1:col
%        if(j==col)
%            fprintf(fid,'%g\n',MMatpcal(i,j));
%        else
%            fprintf(fid,'%g\t',MMatpcal(i,j));
%        end 
%    end 
%end
%fclose(fid);

disp('all finshed!')



        
    








        
        
        
   
  
    