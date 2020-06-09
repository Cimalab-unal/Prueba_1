clc
clear
data3=readtable('sub1_3D.csv');
data2=table2array(data3);
s=size(data2);
%
data=[];
for n=1:s(2)
    
   temp=data2(:,n)-mean(data2(:,n));
   for m=1:s(1)-5
   if temp(m)>std(temp)
       temp(m)=temp(m+5);
   end 
   end 
   data_temp= sgolayfilt(temp,2,15)+mean(data2(:,n));
   data(:,n)=data_temp;
   clear data_temp
end

names= data3.Properties.VariableNames; 
data=array2table(data,'VariableNames',names);
%%
clear data3 data2
data3=readtable('sub1_2D.csv');
data2=table2array(data3);
s=size(data2);
%
data_1=[];
for n=1:s(2)
    
   temp=data2(:,n)-mean(data2(:,n));
   for m=1:s(1)-5
   if temp(m)>std(temp)
       temp(m)=temp(m+5);
   end 
   end 
   data_temp= sgolayfilt(temp,2,5)+mean(data2(:,n));
   data_1(:,n)=data_temp;
   clear data_temp
end

names= data3.Properties.VariableNames; 
data_1=array2table(data_1,'VariableNames',names);

%%
cual=4
plot(data2(:,cual),'r');hold on;
plot(data_1.X2,'b')
legend('original','filt')
%axis([0 5000 -300 600 ])
%% 
% convencion articulaciones
HIP = 0; R_HIP = 1; R_KNEE = 2; R_FOOT = 3;
L_HIP = 4; L_KNEE = 5;L_FOOT = 6;
SPINE = 7;THORAX = 8;NOSE = 9;
HEAD = 10;L_SHOULDER = 11; L_ELBOW = 12;
L_WRIST = 13;R_SHOULDER = 14;R_ELBOW = 15;
R_WRIST = 16;
%% plot 3D model
close all
%data=readtable('work1.csv');
clc
s=size(data);
gross=2;joint=3;
color_R='y';color_L='y';color_C='y';
factorx=1;factory=1;factorz=-1;
v=[-310 80 70];
clear im angles
fig=figure;
inicio=300;
final=500;

pos1 = [0.02 0.1 0.4 0.6];
pos2 = [0.5 0.9 0.4 0.1];
pos3=  [0.5 0.8 0.4 0.1];
pos4=  [0.5 0.7 0.4 0.1];
pos5=  [0.5 0.6 0.4 0.1];
pos6=  [0.5 0.5 0.4 0.1];
pos7=  [0.5 0.5 0.4 0.1];

for n=inicio:final   
    ax1=subplot('Position',pos1);   
% central (pelvis, torax, cabeza)
plot3(factorx*data.Z_Hip(n),factory*data.X_Hip(n),factorz*data.Y_Hip(n),'go','MarkerSize',joint);hold on    
plot3(factorx*data.Z_S(n),factory*data.X_S(n),factorz*data.Y_S(n),'ko','MarkerSize',joint)  
plot3(factorx*data.Z_T(n),factory*data.X_T(n),factorz*data.Y_T(n),'ko','MarkerSize',joint)
plot3([factorx*data.Z_Hip(n),factorx*data.Z_S(n)],[factory*data.X_Hip(n),factory*data.X_S(n)],...
[factorz*data.Y_Hip(n),factorz*data.Y_S(n)],color_C,'LineWidth',gross)
plot3([factorx*data.Z_S(n),factorx*data.Z_T(n)],[factory*data.X_S(n),factory*data.X_T(n)],...
[factorz*data.Y_S(n),factorz*data.Y_T(n)],color_C,'LineWidth',gross)
plot3([factorx*data.Z_T(n),factorx*data.Z_H(n)],[factory*data.X_T(n),factory*data.X_H(n)],...
[factorz*data.Y_T(n),factorz*data.Y_H(n)],color_C,'LineWidth',gross)

plot3([factorx*data.Z_Hip(n),factorx*data.Z_RS(n)],[factory*data.X_Hip(n),factory*data.X_RS(n)],...
[factorz*data.Y_Hip(n),factorz*data.Y_RS(n)],color_C,'LineWidth',gross)
plot3([factorx*data.Z_Hip(n),factorx*data.Z_LS(n)],[factory*data.X_Hip(n),factory*data.X_LS(n)],...
[factorz*data.Y_Hip(n),factorz*data.Y_LS(n)],color_C,'LineWidth',gross)


% % % MI izquierdo    
plot3(factorx*data.Z_LF(n),factory*data.X_LF(n),factorz*data.Y_LF(n),'ro','MarkerSize',joint);hold on;
plot3(factorx*data.Z_LK(n),factory*data.X_LK(n),factorz*data.Y_LK(n),'ro','MarkerSize',joint)
plot3([factorx*data.Z_LF(n),factorx*data.Z_LK(n)],[factory*data.X_LF(n),factory*data.X_LK(n)],...
[factorz*data.Y_LF(n),factorz*data.Y_LK(n)],color_L,'LineWidth',gross)
grid on
plot3(factorx*data.Z_LH(n),factory*data.X_LH(n),factorz*data.Y_LH(n),'ro','MarkerSize',joint);hold on;
plot3([factorx*data.Z_LK(n),factorx*data.Z_LH(n)],[factory*data.X_LK(n),factory*data.X_LH(n)]...
    ,[factorz*data.Y_LK(n),factorz*data.Y_LH(n)],color_L,'LineWidth',gross)

%%%% Pelvis

plot3([factorx*data.Z_RH(n),factorx*data.Z_LH(n)],[factory*data.X_RH(n),factory*data.X_LH(n)],...
[factorz*data.Y_RH(n),factorz*data.Y_LH(n)],color_C,'LineWidth',gross)

% % % MI derecho
plot3(factorx*data.Z_RF(n),factory*data.X_RF(n),factorz*data.Y_RF(n),'ro','MarkerSize',joint);hold on;
plot3(factorx*data.Z_RK(n),factory*data.X_RK(n),factorz*data.Y_RK(n),'ro','MarkerSize',joint)
plot3([factorx*data.Z_RF(n),factorx*data.Z_RK(n)],[factory*data.X_RF(n),factory*data.X_RK(n)],...
[factorz*data.Y_RF(n),factorz*data.Y_RK(n)],color_R,'LineWidth',gross)
grid on
plot3(factorx*data.Z_RH(n),factory*data.X_RH(n),factorz*data.Y_RH(n),'ro','MarkerSize',joint);hold on;
plot3([factorx*data.Z_RK(n),factorx*data.Z_RH(n)],[factory*data.X_RK(n),factory*data.X_RH(n)]...
    ,[factorz*data.Y_RK(n),factorz*data.Y_RH(n)],color_R,'LineWidth',gross)

% % %  %MS D

plot3(factorx*data.Z_RW(n),factory*data.X_RW(n),factorz*data.Y_RW(n),'ro','MarkerSize',joint);hold on;
plot3(factorx*data.Z_RE(n),factory*data.X_RE(n),factorz*data.Y_RE(n),'ro','MarkerSize',joint)
plot3([factorx*data.Z_RW(n),factorx*data.Z_RE(n)],[factory*data.X_RW(n),factory*data.X_RE(n)],...
[factorz*data.Y_RW(n),factorz*data.Y_RE(n)],color_R,'LineWidth',gross)
grid on
plot3(factorx*data.Z_RS(n),factory*data.X_RS(n),factorz*data.Y_RS(n),'ro','MarkerSize',joint);hold on;
plot3([factorx*data.Z_RE(n),factorx*data.Z_RS(n)],[factory*data.X_RE(n),factory*data.X_RS(n)]...
    ,[factorz*data.Y_RE(n),factorz*data.Y_RS(n)],color_R,'LineWidth',gross)

% % %MSI
plot3(factorx*data.Z_LW(n),factory*data.X_LW(n),factorz*data.Y_LW(n),'ro','MarkerSize',joint);hold on;
plot3(factorx*data.Z_LE(n),factory*data.X_LE(n),factorz*data.Y_LE(n),'ro','MarkerSize',joint)
plot3([factorx*data.Z_LW(n),factorx*data.Z_LE(n)],[factory*data.X_LW(n),factory*data.X_LE(n)],...
[factorz*data.Y_LW(n),factorz*data.Y_LE(n)],color_L,'LineWidth',gross)
grid on
plot3(factorx*data.Z_LS(n),factory*data.X_LS(n),factorz*data.Y_LS(n),'ro','MarkerSize',joint);hold on;
plot3([factorx*data.Z_LE(n),factorx*data.Z_LS(n)],[factory*data.X_LE(n),factory*data.X_LS(n)]...
    ,[factorz*data.Y_LE(n),factorz*data.Y_LS(n)],color_L,'LineWidth',gross)


% % % % cintura escapular

plot3([factorx*data.Z_RS(n),factorx*data.Z_LS(n)],[factory*data.X_RS(n),factory*data.X_LS(n)],...
[factorz*data.Y_RS(n),factorz*data.Y_LS(n)],color_C,'LineWidth',gross)

% % Cabeza 
% 
% plot3(data.X1(n),-factory*data.Y1(n),data.Z1(n),'ko','MarkerSize',5,'LineWidth',2)
% plot3(data.X5(n),-data.Y5(n),data.Z5(n),'b.','MarkerSize',18,'LineWidth',2);
% plot3(data.X4(n),-data.Y4(n),data.Z4(n),'m.','MarkerSize',18,'LineWidth',2);
% plot3(data.X3(n),-data.Y3(n),data.Z3(n),'b.','MarkerSize',18,'LineWidth',2);
% plot3(data.X2(n),-data.Y2(n),data.Z2(n),'m.','MarkerSize',18,'LineWidth',2);
% if n>100
% plot(data.X16(n:n+20),-data.Y16(n:n+20),'g','LineWidth',1);hold on;
% %axis([100 550 -500 0])
% end
xlabel('Dimension 1X');xlim([-1.1 1.1])
ylabel('Dimension 2Y');ylim([-0.6 0.5])
zlabel('Dimension 3Z');zlim([-1 0.9])
view(v)
% title(strcat('tiempo en segundos = ',....
%     num2str(round(0.015*n,4,'significant'))),'FontSize',15)
% set(gca,'Color','w')
set(gca,'Color','k')
 b=n-(inicio-1)
 grid on;ax1.GridColor = 'w';ax1.GridAlpha=0.5;
 %plot3(data.Z_Hip(1:b),data.Y_Hip(1:b),-1.2*(ones(b,1)),'g')
  plot(data.Z_RS(inicio:n),data.X_RS(inicio:n),'g');hold on
hold off

ax2=subplot('Position',pos2);
% plot3(factorx*data.Z_Hip(1:b),factory*data.X_Hip(1:b),...
% factorz*data.Y_S(1:b),'r','LineWidth',gross); hold on;
% title('CoG 3D','Fontsize',13)
% grid on;view(v);
% xlabel('Dimension 1X');xlim([-0.5 0.3])
% ylabel('Dimension 2Y');ylim([-0.06 -0.02])
% zlabel('Dimension 3Z');zlim([0.15 0.25])
T=data_1;

% (17 15 13)= (tibillo, rodilla, cadera)* derecha
clear sgf sgf1 angles_acut
 gros2=2;
    P0 = [T.X15(n),T.Y15(n)]; P1 = [T.X13(n),T.Y13(n)]; P2 = [T.X17(n),T.Y17(n)];
    angles(b)= (atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0)))*180/pi;
    angles_acut=180-angles;plot(angles_acut(1:b),'r','LineWidth',gros2);hold on;
   xlim([0 n]); grid on; legend('rodilla der'); hold off;
   
 % (17 15 13)= (tibillo, rodilla, cadera)* izquierda
   ax2=subplot('Position',pos3);
       P0 = [T.X14(n),T.Y14(n)]; P1 = [T.X12(n),T.Y12(n)]; P2 = [T.X16(n),T.Y16(n)];
    angles(b)= (atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0)))*180/pi;
    angles_acut=180-angles;plot(angles_acut(1:b),'m','LineWidth',gros2);hold on;
   xlim([0 n]);grid on;legend('rodilla izq') ; hold off

    ax2=subplot('Position',pos4);
% % rodilla derecha
    P0 = [T.X13(n),T.Y13(n)]; P1 = [T.X15(n),T.Y15(n)]; P2 = [T.X13(n),T.Y15(n)];
    angles2(b)= (atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0)))*180/pi;
    angles_acut2=180-angles2;plot(angles_acut2(1:b),'b','LineWidth',gros2);
    grid on;grid on;legend('cadera der');
     xlim([0 n]); hold off
    
    ax2=subplot('Position',pos5);
    
   P0 = [T.X9(n),T.Y9(n)]; P1 = [T.X7(n),T.Y7(n)]; P2 = [T.X11(n),T.Y11(n)];
   angles3(b)= (atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0)))*180/pi;
   angles_acut3=180-angles3;plot(angles_acut3(1:b),'m','LineWidth',gros2)
   xlim([0 n]);legend('codo der'); grid on; hold off
   
    ax2=subplot('Position',pos6);
    P0 = [T.X7(n),T.Y7(n)]; P1 = [T.X9(n),T.Y9(n)]; P2 = [T.X7(n),T.Y9(n)];
         angles4(b)= (atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0)))*180/pi;
    angles_acut4=angles4+95;plot(angles_acut4(1:b),'k','LineWidth',gros2)
    xlim([0 n]);grid on;legend('hombro der'); hold off;
    grid on
     width=1200;height=600;
    x0=10;y0=20;
    set(gcf,'position',[x0,y0,width,height])
   
     hold off
    
    drawnow
    frame = getframe(fig);
    im{b} = frame2im(frame);
clc
n
end 
%%
display('Guardando video.....')
%
fps=30;
nombre='sub1'
file=strcat(nombre,'_3D_CoG');
writerObj = VideoWriter(file);
writerObj.FrameRate = fps;
open(writerObj);
for i=2:length(im)

frame =im{i};
writeVideo(writerObj,frame);

end
close(writerObj);


 
%%
label='marcha_3D'
filename = strcat(label,'.gif'); % Specify the output file name
for idx = 1:length(im)
    [A,map] = rgb2ind(im{idx},256);
    if idx == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.03);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.03);
    end
end
display('listo')
%%

T=data;
angles=[];
clear sgf sgf1 angles_acut
for i = inicio:final
    P0 = [T.X15(i),T.Y15(i)]; P1 = [T.X13(i),T.Y13(i)]; P2 = [T.X17(i),T.Y17(i)];
    ang = atan2(abs(det([P2-P0;P1-P0])),dot(P2-P0,P1-P0));  
    angles = [angles;ang];
   %end
end

angles = angles*180/(pi);angles_acut=180-angles;
%filtro polinomial
order = 2; framelen = 9;
sgf = sgolayfilt(angles_acut,order,framelen);
knee_right=sgf;
plot(angles_acut,'r');hold on; plot(knee_right,'g')


%%
a=150:1:length(X2)-100;
temp=1:1:length(X2)-100;
for k=a
s=plot3(Z2(1:k),X2(1:k),Y2(1:k),'bo'); 
s(1).LineWidth=1;
   s2(1).LineWidth=1;
hold on;
%t=plot3(Z3(1:k),X3(1:k),Y3(1:k),'ro');
u=plot3(Z4(1:k),X4(1:k),Y4(1:k),'ko');
%axis([-30 50 -30 50 -40 50])
 %v = [20 15 18];
view(v)
   set(gca, 'fontsize', 15)
   grid on
   title('Phase space','fontsize', 25,'FontWeight','normal')
xlabel(['$X(t)$'],'Interpreter','latex','fontsize', 27); 
ylabel(['$Z(t-\mathcal{T})$'],'Interpreter','latex','fontsize', 27); 
zlabel(['$Y(t-2\mathcal{T})$'],'Interpreter','latex','fontsize', 27); 
%legend('Control','Parkinson','fontsize',20)%'Position',[0.2 0.2 0.1 0.2])
hold off;
pause
end