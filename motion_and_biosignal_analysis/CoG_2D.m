%% section 1 config
clear;clc;close all
nombre='P1';
keypoint= strcat(nombre,'.csv');
video_file=strcat(nombre,'.mp4');
video= VideoReader(video_file);
display('Numero de cuadros de video')
video.NumFrames
cuadro=read(video,[30,31]);
imshow(cuadro(:,:,1))
%x1= limite izq ,x2=limite derecho, 
%y1= limite superior ,y2= limite infeior
%intervalo= numero de cuadros del corte (max 400) ,start= punto inicial del video
%cortes = numero de segmentos de video
%fps = frames por segundo (velocidad del video) normal =25-30
x1=200;x2=1000;
y2=60;y1=600;
intervalo=30;start=400;
cortes=15;fps=30;
% Seccion 2 Para generar modelo 2D y video.avi
clc; close all
display('calculando centro de gravedad...')
[CoG_X, CoG_Y, cogx, cogy, cogx2, cogy2, data]=CoG2d_calculation(keypoint);
    for k=1:cortes
    if k==1;
    F_inicio=start; 
    elseif k>1; 
    F_inicio=start+intervalo*(k-1);
    end
    lim_i=F_inicio+2;
    lim_s=F_inicio+1+intervalo;
    [im_frames,video]=keypoints_read(video_file,data,F_inicio,intervalo,....
            CoG_X, CoG_Y, cogx, cogy, cogx2, cogy2,....
             x1,x2,y1,y2);
    temp1=im_frames;
    if k==1
    frames=temp1;    
    elseif k>1
    frames=cat(1,frames,temp1);      
    end 
    clear im_frames temp1
    size(frames)
    close all
    end 
%
display('Guardando video.....')
%
file=strcat(nombre,'_2D_CoG');
writerObj = VideoWriter(file);
writerObj.FrameRate = fps;
open(writerObj);
for i=2:length(frames)-100

frame =frames{i};
writeVideo(writerObj,frame);

end
close(writerObj);
display('termino de escribir video .avi')
display('Depto Mov Corporal Humano UN---')
display('Gracias por usar nuestro prototipo:')
display('===== Citar =====')
display('** Implementacion:') 
display('G Pineda FT MSc Computer imaging and medical applications Cimalab')
display('Universidad Nacional de Colombia')
display('**Fuente deteccion:') 
display('3D human pose estimation in video with temporal convolutions and semi-supervised training---');
display('Pavllo, Dario and Feichtenhofer, Christoph and Grangier, David and Auli, Michael');
display('Conference on Computer Vision and Pattern Recognition (CVPR)');
%% seccion 2 GIF maker solo para tramos cortos no superior a 300 cuadros
clc
display('obtener gif')
filename = strcat(nombre,'_2D_CoG.gif'); % Specify the output file name
for idx = 1:length(frames)
    [A,map] = rgb2ind(frames{idx},256);
    if idx == 1
        imwrite(A,map,filename,'gif','LoopCount',Inf,'DelayTime',0.04);
    else
        imwrite(A,map,filename,'gif','WriteMode','append','DelayTime',0.04);
    end
end
display('Gif terminado')
% creditos
clc
display('Depto Mov Corporal Humano UN---')
display('Gracias por usar nuestro prototipo:')
display('===== Citar =====')
display('** Implementacion:') 
display('G Pineda FT MSc Computer imaging and medical applications Cimalab')
display('Universidad Nacional de Colombia')
display('**Fuente deteccion:') 
display('3D human pose estimation in video with temporal convolutions and semi-supervised training---');
display('Pavllo, Dario and Feichtenhofer, Christoph and Grangier, David and Auli, Michael');
display('Conference on Computer Vision and Pattern Recognition (CVPR)');
