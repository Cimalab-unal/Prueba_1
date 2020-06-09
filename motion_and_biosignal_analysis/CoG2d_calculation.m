function[CoG_X, CoG_Y, cogx, cogy, cogx2, cogy2, data]=CoG2d_calculation(keypoint)
data3=readtable(keypoint);
data2=table2array(data3);
s=size(data2);

data=[];
for n=1:s(2)
    
   temp=data2(:,n)-mean(data2(:,n));
   for m=1:s(1)-5
   if temp(m)>std(temp)
       temp(m)=temp(m+5);
   end 
   end 
   data(:,n)= sgolayfilt(temp,2,15)+mean(data2(:,n));
  
end

names= data3.Properties.VariableNames; 
data=array2table(data,'VariableNames',names);
T=data;
clear cogx cogy
len = size(T);
names=T.Properties.VariableNames;
com_loc=[0.43 0.43 0.436 0.436 ....
    0.433 0.433 0.434 0.434];%....
    %0.6 0.5];
cogx = [];
idx1=[12 14 16 18 24 26 28 30];
for k = idx1
    names{k};
    c=find(idx1==k);
    for i=1:len(1)
    P1=[T{i,k},-T{i,k+1}];
    P2=[T{i,k+4},-T{i,k+5}];
    d1=norm(P2(1)-P1(1));comx=d1*com_loc(c);
    d1=norm(P2(2)-P1(2));comy=d1*com_loc(c);
    
    if P2(1)-P1(1)<0 
        cogx(i,c)=-comx+P1(1);
    elseif P2(1)-P1(1)>0  
        cogx(i,c)=comx+P1(1);
    elseif  P2(1)-P1(1)== 0
        cogx(i,c)=P1(1);
    end 
    
    if P2(2)-P1(2)<0 
        cogy(i,c)=-comy+P1(2);
    elseif P2(2)-P1(2)>0  
        cogy(i,c)=comy+P1(2);
    elseif  P2(2)-P1(2)== 0
        cogy(i,c)=P1(2);
    end 
    
    end
 
end 
 % armar un df de coordernadas de trono

for n=1:len(1) 
t1x(n,1)=abs(T.X13(n)-T.X12(n))/2+min([T.X13(n),T.X12(n)]);
t1y(n,1)=abs(-T.Y13(n)-(-T.Y12(n)))+min([-T.Y13(n),-T.Y12(n)]);
t2x(n,1)=abs(T.X7(n)-T.X6(n))/2+min([T.X7(n),T.X6(n)]);
t2y(n,1)=abs(-T.Y7(n)-(-T.Y6(n)))+min([-T.Y7(n),-T.Y6(n)]);
end 
T_core=table(T.X1,-T.Y1,t2x,t2y,t1x,t1y);

com_loc=[0.4 0.56];
cogx2 = [];cogy2=[];
idx1=[1 3];
for k = idx1
    c=find(idx1==k);
    for i=1:len(1)
    P1=[T_core{i,k},T_core{i,k+1}];
    P2=[T_core{i,k+2},T_core{i,k+3}];
    d1=norm(P2(1)-P1(1));comx=d1*com_loc(c);
    d1=norm(P2(2)-P1(2));comy=d1*com_loc(c);
    
    if P2(1)-P1(1)<0 
        cogx2(i,c)=-comx+P1(1);
    elseif P2(1)-P1(1)>0  
        cogx2(i,c)=comx+P1(1);
    elseif  P2(1)-P1(1)== 0
        cogx2(i,c)=P1(1);
    end 
    
    if P2(2)-P1(2)<0 
        cogy2(i,c)=-comy+P1(2);
    elseif P2(2)-P1(2)>0  
        cogy2(i,c)=comy+P1(2);
    elseif  P2(2)-P1(2)== 0
        cogy2(i,c)=P1(2);
    end 
    
    end
 
end 
 % Calculo de centro de masa
 
 % [ brazos, antebrazos, muslos, piernas, cabeza y tronco]
 w=[0.028 0.028 0.018 0.018 0.1 0.1 0.047 0.047 0.082 0.47];
 w=ones(1,10);
 centroidsx=[cogx,cogx2];
 centroidsy=[cogy,cogy2];
 
 for g=1:len(1)
 CoG_X(g,1)=dot(centroidsx(g,:),w)/10;
 CoG_Y(g,1)=dot(centroidsy(g,:),w)/10;
%  CoG_X(g,1)=sum(centroidsx(g,:).*w)/10;
%  CoG_Y(g,1)=sum(centroidsy(g,:).*w)/10;
 end 

 CoG(:,1)=CoG_X;
 CoG(:,2)=CoG_Y;
 
end 