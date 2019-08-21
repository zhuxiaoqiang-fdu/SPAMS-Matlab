function varargout = SPAMS_Calibration_GUI(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 21-Aug-2019 13:24:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global Mat
global iff
global pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10 pos11 pos12
global neg1 neg2 neg3 neg4 neg5 neg6 neg7 neg8 neg9
pos1=0; pos2=0; pos3=0; pos4=0; pos5=0; pos6=0; pos7=0; pos8=0; pos9=0; pos10=0; pos11=0; pos12=0;
neg1=0; neg2=0; neg3=0; neg4=0; neg5=0; neg6=0; neg7=0; neg8=0; neg9=0;
iff=1;
filename=['easycoco_ambient\1 (' num2str(iff) ')' '.csv'];
Mat = csvread(filename, 1, 0);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Mat
global iff
iff=iff+1;
%clear Mat
filename=['easycoco_ambient\1 (' num2str(iff) ')' '.csv'];
Mat = csvread(filename, 1, 0);
axes(handles.axes1) ;
cla reset
axes(handles.axes2) ;
cla reset
axes(handles.axes3) ;
cla reset
axes(handles.axes4) ;
cla reset


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Mat
global MMatpcal
global pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10 pos11 pos12
global neg1 neg2 neg3 neg4 neg5 neg6 neg7 neg8 neg9


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
qmz77=[qc6h5 qcacl qnah2o3];

qvo=66.9353;
qc5h7=67.0566;
qmz67=[qvo qc5h7];

qc7h5=89.0366;
qna2bo2=88.9744;
qmz89=[qc7h5 qna2bo2];

qc8h6=102.04;
qcano3=101.957;
qmz102=[qc8h6 qcano3];
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
qmz80=[qso3 qc6h8];

qc7h=85.0029;
qnano3=84.9724;
qmz85=[qc7h qnano3];

qkcl2=108.899;
qc9h=109.011;
qnabo22=108.985;
qmz109=[qkcl2 qc9h qnabo22];

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

MMat=Mat;
MMatp=MMat;  %the result of the calibration
MMatpcal=MMatp;

for i=2:2:4
    MMatpcal(:,i)=0;
end

z_1=[]; z_2=[]; z_3=[]; z_4=[]; z_5=[]; z_6=[]; z_7=[]; z_8=[]; z_9=[]; z_10=[]; z_11=[]; z_12=[]; z_13=[];
%pos calibration
[m1 n1]=size(MMat);
i=1;
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
        [mz67 indexmz67]=max(MMat(x19:x20,i+1));
        indexmz67=indexmz67+x19-1;
        [mz77 indexmz77]=max(MMat(x21:x22,i+1));
        indexmz77=indexmz77+x21-1;
        [mz89 indexmz89]=max(MMat(x23:x24,i+1));
        indexmz89=indexmz89+x23-1;
        [mz102 indexmz102]=max(MMat(x25:x26,i+1));
        indexmz102=indexmz102+x25-1;
        
        
        
        %校正值
        z1=MMat(indexc,i);
        if MMat(indexc,i+1)>0 && pos1==1 
          z=[z z1];
          q=[q qc];
          z_1=[z_1 z1];
        end
        
        z2=MMat(indexna,i);
        if MMat(indexna,i+1)>0 && pos2==1
          z=[z z2];
          q=[q qna];
          z_2=[z_2 z2];
        end 
        
        z3=MMat(indexal,i);
        if MMat(indexal,i+1)>0 
           %z=[z z3];
           %q=[q qal];
           z_3=[z_3 z3];
        end
        
        z4=MMat(indexk,i);
        if MMat(indexk,i+1)>0 && pos3==1
           z=[z z4];
           q=[q qk];
           z_4=[z_4 z4];
        end
        
        z5=MMat(indexc3,i);
        if MMat(indexc3,i+1)>0 && pos4==1
           z=[z z5];
           q=[q qc3];
           z_5=[z_5 z5];
        end
        
        z6=MMat(indexfe,i);
        if MMat(indexfe,i+1)>0 && pos5==1
           z=[z z6];
           q=[q qfe];
           z_6=[z_6 z6];
        end

        z7=MMat(indexpb_208,i);
        if MMat(indexpb_208,i+1)>0 && pos6==1
           z=[z z7];
           q=[q qpb_208];
           z_7=[z_7 z7];
        end
        
        z8=MMat(indexpb_206,i);
        if MMat(indexpb_206,i+1)>0 && pos7==1
           z=[z z8];
           q=[q qpb_206];
           z_8=[z_8 z8];
        end
        
        z9=MMat(indexpb_207,i);
        if MMat(indexpb_207,i+1)>0 && pos8==1
           z=[z z9];
           q=[q qpb_207];
           z_9=[z_9 z9];
        end
        
        z10=MMat(indexmz67,i);
        if MMat(indexmz67,i+1)>0 && pos9==1
            z=[z z10];
            [~, I]=min(abs(qmz67(:)-z10));
            q=[q qmz67(I)];
            z_10=[z_10 z10];
        end
        
        z11=MMat(indexmz77,i);
        if MMat(indexmz77,i+1)>0 && pos10==1
            z=[z z11];
            [~, I]=min(abs(qmz77(:)-z11));
            q=[q qmz77(I)];
            z_11=[z_11 z11];
        end
        
        z12=MMat(indexmz89,i);
        if MMat(indexmz89,i+1)>0 && pos11==1
            z=[z z12];
            [~, I]=min(abs(qmz89(:)-z12));
            q=[q qmz89(I)];
            z_12=[z_12 z12];
        end
        
        z13=MMat(indexmz102,i);
        if MMat(indexmz102,i+1)>0 && pos12==1
            z=[z z13];
            [~, I]=min(abs(qmz102(:)-z13));
            q=[q qmz102(I)];
            z_13=[z_13 z13];
        end
        
        
        
        
        
        [aa bb]=size(q);
       if bb>4
        p=polyfit(z,q,1);
        r21=corrcoef(z,q);
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
            MMatpcal(:,2)=0;
        end 
            


zz_1=[]; zz_2=[]; zz_3=[]; zz_4=[]; zz_5=[]; zz_6=[]; zz_7=[]; zz_8=[]; zz_9=[]; zz_10=[]; zz_11=[];
%neg calibration 
i=3;
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
        
        if MMat(j,i)<108.9 && MMat(j+1,i)>108.9 % c9h kcl2 nabo22 
            xx17=j;
        end
        if MMat(j,i)<109.1 && MMat(j+1,i)>109.1
            xx18=j+1;
        end
        
        if MMat(j,i)<84.9 && MMat(j+1,i)>84.9   % c7h nano3
            xx19=j;
        end
        if MMat(j,i)<85.1 && MMat(j+1,i)>85.1
            xx20=j+1;
        end
        
        if MMat(j,i)<79.9 && MMat(j+1,i)>79.9  % so3 c6h8
            xx21=j;
        end
        if MMat(j,i)<80.1 && MMat(j+1,i)>80.1
            xx22=j+1;
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
    [mz109 indexmz109]=max(MMat(xx17:xx18,i+1));
    indexmz109=indexmz109+xx17-1;
    [mz85 indexmz85]=max(MMat(xx19:xx20,i+1));
    indexmz85=indexmz85+xx19-1;
    [mz80 indexmz80]=max(MMat(xx21:xx22,i+1));
    indexmz80=indexmz80+xx21-1;
    
    
    
    
    zz1=MMat(indexno3,i);
    if MMat(indexno3,i+1)>0 && neg1==1
      zz=[zz zz1];
      qq=[qq qno3];
      zz_1=[zz_1 zz1];
    end
    
    zz2=MMat(indexcn,i);
    if MMat(indexcn,i+1)>0 && neg2==1
      zz=[zz zz2];
      qq=[qq qcn];
      zz_2=[zz_2 zz2];
    end

    zz3=MMat(indexcl35,i);
    if MMat(indexcl35,i+1)>0 && neg3==1
        zz=[zz zz3];
        qq=[qq qcl35];
        zz_3=[zz_3 zz3];
    end
    
    zz4=MMat(indexso4,i);
    if MMat(indexso4,i+1)>0 && neg4==1
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
    if MMat(indexno2,i+1)>0 && neg5==1
        zz=[zz zz6];
        qq=[qq qno2];
        zz_6=[zz_6 zz6];
    end

    zz7=MMat(indexno,i);
    if MMat(indexno,i+1)>0
        %zz=[zz zz7];
        %qq=[qq qno];
        zz_7=[zz_7 zz7];
    end 
    
    zz8=MMat(indexhso4,i);
    if MMat(indexhso4,i+1)>0 && neg6==1
        zz=[zz zz8];
        qq=[qq qhso4];
        zz_8=[zz_8 zz8];
    end
    
     zz9=MMat(indexmz109,i);
    if MMat(indexmz109,i+1)>0 && neg9==1
        zz=[zz zz9];
        [~, I]=min(abs(qmz109(:)-zz9));
        qq=[qq qmz109(I)];
        zz_9=[zz_9 zz9];
    end
    
    zz10=MMat(indexmz85,i);
    if MMat(indexmz85,i+1)>0 && neg8==1
        zz=[zz zz10];
        [~, I]=min(abs(qmz85(:)-zz10));
        qq=[qq qmz85(I)];
        zz_10=[zz_10 zz10];
    end
    
    zz11=MMat(indexmz80,i);
    if MMat(indexmz80,i+1)>0 && neg7==1
        zz=[zz zz11];
        [~, I]=min(abs(qmz80(:)-zz11));
        qq=[qq qmz80(I)];
        zz_11=[zz_11 zz11];
    end
    
        [aa bb]=size(qq);
       if bb>4
        pp=polyfit(zz,qq,1);
        r22=corrcoef(zz,qq);
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
            MMatpcal(:,4)=0;
        end
axes(handles.axes3);
plot(z,q)
hold on
plot(z,q,'LineStyle','none','Marker','o','MarkerSize',10,...
    'MarkerFace','y','MarkerEdge',[1,0,0],'LineWidth',2)
xlabel('Measurement m/z','FontWeight','bold','FontSize',12);ylabel('Theoretical m/z','FontWeight','bold','FontSize',12)
if p(2)>0
    le=['X+'];
else
    le=['X'];
end
legendname1=['Y=',num2str(p(1)),le,num2str(p(2)),sprintf('\n'),'R=',num2str(r21(1,2))];
legend(legendname1,'location','NorthWest');

axes(handles.axes4);
plot(zz,qq)
hold on
plot(zz,qq,'LineStyle','none','Marker','o','MarkerSize',10,...
    'MarkerFace','y','MarkerEdge',[1,0,0],'LineWidth',2)
xlabel('Measurement m/z','FontWeight','bold','FontSize',12);ylabel('Theoretical m/z','FontWeight','bold','FontSize',12)
if pp(2)>0
    lee=['X+'];
else
    lee=['X'];
end
legendname1=['Y=',num2str(pp(1)),lee,num2str(pp(2)),sprintf('\n'),'R=',num2str(r22(1,2))];
legend(legendname1,'location','NorthWest');

axes(handles.axes1);
plot(MMatpcal(:,1),MMatpcal(:,2))
xlabel('MZ-Pos','FontWeight','bold','FontSize',12,'parent',handles.axes1);
ylabel('Ion Intensity','FontWeight','bold','FontSize',12,'parent',handles.axes1);


axes(handles.axes2);
plot(MMatpcal(:,3),MMatpcal(:,4))
xlabel('MZ-Neg','FontWeight','bold','FontSize',12,'parent',handles.axes2);
ylabel('Ion Intensity','FontWeight','bold','FontSize',12,'parent',handles.axes2);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global MMatpcal
xlswrite('result_calibration.xlsx',MMatpcal);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global pos1
if ( get(hObject,'Value') )
pos1 = 1;
else
pos1 = 0;
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global pos2
if ( get(hObject,'Value') )
pos2 = 1;
else
pos2 = 0;
end


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global pos3
if ( get(hObject,'Value') )
pos3 = 1;
else
pos3 = 0;
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global pos4
if ( get(hObject,'Value') )
pos4 = 1;
else
pos4 = 0;
end


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
global pos5
if ( get(hObject,'Value') )
pos5 = 1;
else
pos5 = 0;
end


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
global pos6
if ( get(hObject,'Value') )
pos6 = 1;
else
pos6 = 0;
end


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
global pos7
if ( get(hObject,'Value') )
pos7 = 1;
else
pos7 = 0;
end


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
global pos8
if ( get(hObject,'Value') )
pos8 = 1;
else
pos8 = 0;
end


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
global pos9
if ( get(hObject,'Value') )
pos9 = 1;
else
pos9 = 0;
end


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10
global pos10
if ( get(hObject,'Value') )
pos10 = 1;
else
pos10 = 0;
end


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11
global pos11
if ( get(hObject,'Value') )
pos11 = 1;
else
pos11 = 0;
end


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12
global pos12
if ( get(hObject,'Value') )
pos12 = 1;
else
pos12 = 0;
end


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13
global neg1;
if ( get(hObject,'Value') )
neg1 = 1;
else
neg1 = 0;
end


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14
global neg2
if ( get(hObject,'Value') )
neg2 = 1;
else
neg2 = 0;
end


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15
global neg3
if ( get(hObject,'Value') )
neg3 = 1;
else
neg3 = 0;
end


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16
global neg4
if ( get(hObject,'Value') )
neg4 = 1;
else
neg4 = 0;
end


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17
global neg5
if ( get(hObject,'Value') )
neg5 = 1;
else
neg5 = 0;
end


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18
global neg6
if ( get(hObject,'Value') )
neg6 = 1;
else
neg6 = 0;
end


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19
global neg7
if ( get(hObject,'Value') )
neg7 = 1;
else
neg7 = 0;
end


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20
global neg8
if ( get(hObject,'Value') )
neg8 = 1;
else
neg8 = 0;
end


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21
global neg9
if ( get(hObject,'Value') )
neg9 = 1;
else
neg9 = 0;
end
