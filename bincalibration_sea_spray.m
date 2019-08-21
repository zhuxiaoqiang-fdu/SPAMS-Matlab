clear clc
mm=dir('easycoco_seaspray');
num=length(mm);

%correct positive bin value 
qna=22.993;
qmg=23.9829;
qk=38.9672;
qna2cl_81=80.9438;
qna2cl_83=82.9421;
qk2cl_113=112.898;
qk2cl_115=114.885;

%correct negtive bin value
qcl35=34.9641;
qcl37=36.9622;
qcn=25.9994;
qcno=41.9971;
qmgcl3_129=128.883;
qmgcl3_131=130.894;
qnacl=57.9574;

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
    filename=['easycoco_seaspray\1 (' num2str(i) ')' '.csv'];
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

z_1=[]; z_2=[]; z_3=[]; z_4=[]; z_5=[]; z_6=[]; z_7=[];
%pos calibration
[m1 n1]=size(MMat);
for i=1:4:(n1-3)
    z=[];q=[];
    for j=1:(m1-1)
    
        if MMat(j,i)<22.9 && MMat(j+1,i)>22.9   %Na
            x1=j;
        end
        if MMat(j,i)<23.1 && MMat(j+1,i)>23.1 
            x2=j+1;
        end
        
        if MMat(j,i)<23.9 && MMat(j+1,i)>23.9 % Mg
            x3=j;
        end
        if MMat(j,i)<24.1 && MMat(j+1,i)>24.1
            x4=j+1;
        end
        
        if MMat(j,i)<38.9 && MMat(j+1,i)>38.9 % K
            x5=j;
        end
        if MMat(j,i)<39.1 && MMat(j+1,i)>39.1 
            x6=j+1;
        end

        if MMat(j,i)<80.9 && MMat(j+1,i)>80.9 % Na2Cl_81
            x7=j;
        end
        if MMat(j,i)<81.1 && MMat(j+1,i)>81.1 
            x8=j+1;
        end 
        
        if MMat(j,i)<82.9 && MMat(j+1,i)>82.9 % Na2Cl_83
            x9=j;
        end
        if MMat(j,i)<83.1 && MMat(j+1,i)>83.1 
            x10=j+1;
        end 
        
        if MMat(j,i)<112.8 && MMat(j+1,i)>112.8 % K2Cl_113
            x11=j;
        end
        if MMat(j,i)<113.0 && MMat(j+1,i)>113.0
            x12=j+1;
        end 
        
        if MMat(j,i)<114.8 && MMat(j+1,i)>114.8 % K2Cl_115
            x13=j;
        end
        if MMat(j,i)<115.0 && MMat(j+1,i)>115.0
            x14=j+1;
        end 
        
    end
        
        [na indexna]=max(MMat(x1:x2,i+1));
        indexna=indexna+x1-1;
        [mg indexmg]=max(MMat(x3:x4,i+1));
        indexmg=indexmg+x3-1;
        [k indexk]=max(MMat(x5:x6,i+1));
        indexk=indexk+x5-1;
        [na2cl_81 indexna2cl_81]=max(MMat(x7:x8,i+1));
        indexna2cl_81=indexna2cl_81+x7-1;
        [na2cl_83 indexna2cl_83]=max(MMat(x9:x10,i+1));
        indexna2cl_83=indexna2cl_83+x9-1;
        [k2cl_113 indexk2cl_113]=max(MMat(x11:x12,i+1));
        indexk2cl_113=indexk2cl_113+x11-1;
        [k2cl_115 indexk2cl_115]=max(MMat(x13:x14,i+1));
        indexk2cl_115=indexk2cl_115+x13-1;
        
        
        %校正值
        z1=MMat(indexna,i);
        if MMat(indexna,i+1)>15 
          z=[z z1];
          q=[q qna];
          z_1=[z_1 z1];
        end
        
        z2=MMat(indexmg,i);
        if MMat(indexmg,i+1)>15
          z=[z z2];
          q=[q qmg];
          z_2=[z_2 z2];
        end 
        
        z3=MMat(indexk,i);
        if MMat(indexk,i+1)>15
           z=[z z3];
           q=[q qk];
           z_3=[z_3 z3];
        end
        
        z4=MMat(indexna2cl_81,i);
        if MMat(indexna2cl_81,i+1)>15
           z=[z z4];
           q=[q qna2cl_81];
           z_4=[z_4 z4];
        end
        
        z5=MMat(indexna2cl_83,i);
        if MMat(indexna2cl_83,i+1)>15
           z=[z z5];
           q=[q qna2cl_83];
           z_5=[z_5 z5];
        end
        
        z6=MMat(indexk2cl_113,i);
        if MMat(indexk2cl_113,i+1)>15
           z=[z z6];
           q=[q qk2cl_113];
           z_6=[z_6 z6];
        end

        z7=MMat(indexk2cl_115,i);
        if MMat(indexk2cl_115,i+1)>15
           z=[z z7];
           q=[q qk2cl_115];
           z_7=[z_7 z7];
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

zz_1=[]; zz_2=[]; zz_3=[]; zz_4=[]; zz_5=[]; zz_6=[]; zz_7=[];
%neg calibration 
for i=3:4:(n1-1)
    zz=[]; qq=[];
    for j=1:(m1-1)
        
        if MMat(j,i)<34.9 && MMat(j+1,i)>34.9   %Cl35
            xx1=j;
        end
        if MMat(j,i)<35.1 && MMat(j+1,i)>35.1
            xx2=j+1;
        end
        
        if MMat(j,i)<36.9 && MMat(j+1,i)>36.9   %Cl37
            xx3=j;
        end
        if MMat(j,i)<37.1 && MMat(j+1,i)>37.1
            xx4=j+1;
        end
        
        if MMat(j,i)<25.9 && MMat(j+1,i)>25.9  %CN
            xx5=j;
        end
        if MMat(j,i)<26.1 && MMat(j+1,i)>26.1
            xx6=j+1;
        end
        
        if MMat(j,i)<41.9 && MMat(j+1,i)>41.9 %CNO
            xx7=j;
        end
        if MMat(j,i)<42.1 && MMat(j+1,i)>42.1 
            xx8=j+1;
        end
        
        if MMat(j,i)<128.8 && MMat(j+1,i)>128.8 %MgCl3_129
            xx9=j;
        end
        if MMat(j,i)<129.0 && MMat(j+1,i)>129.0
            xx10=j+1;
        end
        
        if MMat(j,i)<130.81 && MMat(j+1,i)>130.81   %MgCl3_131
            xx11=j;
        end
        if MMat(j,i)<131.0 && MMat(j+1,i)>131.0
            xx12=j+1;
        end
        
        if MMat(j,i)<57.85 && MMat(j+1,i)>57.85      %NaCl
            xx13=j;
        end
        if MMat(j,i)<58.05 && MMat(j+1,i)>58.05
            xx14=j+1;
        end

    end
    
    %校正值
    [cl35 indexcl35]=max(MMat(xx1:xx2,i+1));
    indexcl35=indexcl35+xx1-1;
    [cl37 indexcl37]=max(MMat(xx3:xx4,i+1));
    indexcl37=indexcl37+xx3-1;
    [cn indexcn]=max(MMat(xx5:xx6,i+1));
    indexcn=indexcn+xx5-1;
    [cno indexcno]=max(MMat(xx7:xx8,i+1));
    indexcno=indexcno+xx7-1;
    [mgcl3_129 indexmgcl3_129]=max(MMat(xx9:xx10,i+1));
    indexmgcl3_129=indexmgcl3_129+xx9-1;
    [mgcl3_131 indexmgcl3_131]=max(MMat(xx11:xx12,i+1));
    indexmgcl3_131=indexmgcl3_131+xx11-1;
    [nacl indexnacl]=max(MMat(xx13:xx14,i+1));
    indexnacl=indexnacl+xx13-1;
    
    zz1=MMat(indexcl35,i);
    if MMat(indexcl35,i+1)>15
      zz=[zz zz1];
      qq=[qq qcl35];
      zz_1=[zz_1 zz1];
    end
    
    zz2=MMat(indexcl37,i);
    if MMat(indexcl37,i+1)>15
      zz=[zz zz2];
      qq=[qq qcl37];
      zz_2=[zz_2 zz2];
    end

    zz3=MMat(indexcn,i);
    if MMat(indexcn,i+1)>15
        zz=[zz zz3];
        qq=[qq qcn];
        zz_3=[zz_3 zz3];
    end
    
    zz4=MMat(indexcno,i);
    if MMat(indexcno,i+1)>15
        zz=[zz zz4];
        qq=[qq qcno];
        zz_4=[zz_4 zz4];
    end
    
    zz5=MMat(indexmgcl3_129,i);
    if MMat(indexmgcl3_129,i+1)>15
        zz=[zz zz5];
        qq=[qq qmgcl3_129];
        zz_5=[zz_5 zz5];
    end
    
    zz6=MMat(indexmgcl3_131,i);
    if MMat(indexmgcl3_131,i+1)>15
        zz=[zz zz6];
        qq=[qq qmgcl3_131];
        zz_6=[zz_6 zz6];
    end

    zz7=MMat(indexnacl,i);
    if MMat(indexnacl,i+1)>15
        zz=[zz zz7];
        qq=[qq qnacl];
        zz_7=[zz_7 zz7];
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

xlswrite('aveMMatpcal_sea_spray.xlsx',aveMMatpcal);

%fid=fopen('calibration result_sea_spray.txt','wt');
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



        
    








        
        
        
   
  
    