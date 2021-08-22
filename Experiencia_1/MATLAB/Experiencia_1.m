% Nombre: Diego Pincheira, Luckas Diaz
% Curso: EL5206
clc
clear all
%% P1
% Importante: requiere la librería "containers"
Pelotas = imread('balls.jpg'); %Cargar img
Pelotas_Escala_Grises = rgb2gray(Pelotas); %Convertir a escala de grises
Umbral_1 = 0.3; % Valores propuestos: 0.3, 0.6, 0.8
BW = imbinarize(Pelotas_Escala_Grises,Umbral_1); %Img a b&n
Umbral_2 = 0.3; % Valores propuestos: 0.3, 0.6, 0.8
Verde_pelotas = imbinarize(Pelotas(:,:,2),Umbral_2); %Img a b&n del canal verde
Llaves_P1 = {'Imagen a color','Imagen en escala de grises',strcat('B&N de Escala de Grises',', t = ',num2str(Umbral_1)),strcat('B&N de canal verde',', t = ',num2str(Umbral_2))};
Valores_P1 = {Pelotas,Pelotas_Escala_Grises,BW,Verde_pelotas};
Imagen = containers.Map(Llaves_P1, Valores_P1);
for key = Llaves_P1
    figure()
    imshow(Imagen(key{1}))
    title(key{1});
end
% Histograma para la imagen original:
figure
bar(imhist(Pelotas(:,:,1)), 'FaceColor', 'r', 'BarWidth', 0.1);
hold on
bar(imhist(Pelotas(:,:,2)), 'FaceColor', 'g', 'BarWidth', 0.09);
bar(imhist(Pelotas(:,:,3)), 'FaceColor', 'b', 'BarWidth', 0.07);
legend('Canal Rojo','Canal Verde','Canal Azul'), xlim([0 255]);
title('Histograma de la imagen ''balls.jpg'' para sus tres canales.');
hold off
% Histograma de escala de grises:
imhist(Pelotas_Escala_Grises)
ylim([0 30000])
title('Histograma de la imagen ''balls.jpg'' en escala de grises.');
ylabel('Frecuencia de aparición')
%% P2
Moon = rgb2gray(imread('moon.png'));
Old = rgb2gray(imread('old.png'));
River = imread('river.png');
Moon_Final = Estiramiento_Contraste(Moon);
Old_Final = Estiramiento_Contraste(Old);
River_Final = Estiramiento_Contraste(River);
%% P3
% Se cargan las imágenes y se pasan a escalas de grises
Fence_Escala_Grises = rgb2gray(imread('fence.png'));
Diagonal_Escala_Grises = rgb2gray(imread('diagonal.jpg'));
% Se obtienen los valores máximos
Fence_ValMax = max(max(double(Fence_Escala_Grises), [], 1));
Diagonal_ValMax = max(max(double(Diagonal_Escala_Grises), [], 1));
% Se obtienen las constantes para transformacion logaritmica
Fence_c = 255/(log(1 + abs(Fence_ValMax))); 
Diagonal_c = 255/(log(1 + abs(Diagonal_ValMax)));
% Se calcula la FFT en dos dimensiones de las imágenes
Fence_fft2 = fft2(double(Fence_Escala_Grises));
Diagonal_fft2 = fft2(double(Diagonal_Escala_Grises));
% Se obtienen las magnitudes de las FFTs
Fence_Abs = abs(Fence_fft2);
Diagonal_Abs = abs(Diagonal_fft2);
% Se aplican las correcciones con transformada logaritmica
Fence_Log = Fence_c*log(1+Fence_Abs);
Diagonal_Log = Diagonal_c*log(1+Diagonal_Abs);
% Se visualizan las magnitudes
figure()
imagesc(Fence_Abs); % visualizacion de la magnitud
title('FFT 2D de ''fence.png''')
figure()
imagesc(Diagonal_Abs);
title('FFT 2D de ''diagonal.jpg''')
% Se visualizan las correcciones
figure()
imshow(Fence_Log, []);
title('FFT 2D de ''fence.png'' corregida')
figure()
imshow(Diagonal_Log, []);
title('FFT 2D de ''diagonal.jpg'' corregida')
%% P4
%cargar la imagen
Megaman = imread('megaman.png');
%convertir a escala de grises
Megaman_Gris = rgb2gray(Megaman);
%rotar la imagen
Megaman_45 = imrotate(Megaman_Gris,-45,'bilinear','crop');
Megaman_60 = imrotate(Megaman_Gris,-60,'bilinear','crop');
%valor maximo
Megaman_ValMax = max(max(double(Megaman_Gris), [], 1));
%constante para transformacion logaritmica
Megaman_c = 255/(log(1 + abs(Megaman_ValMax)));
%fft2 de las imagen
Megaman_fft2 = fft2(Megaman_Gris);
Megaman_45_fft2 = fft2(Megaman_45);
Megaman_60_fft2 = fft2(Megaman_60);
%fftshift de la fft2
Megaman_shift = fftshift(Megaman_fft2);
Megaman_45_shift = fftshift(Megaman_45_fft2);
Megaman_60_shift = fftshift(Megaman_60_fft2);
%magnitud del fftshift
Megaman_Abs = abs(Megaman_shift);
Megaman_45_Abs = abs(Megaman_45_shift);
Megaman_60_Abs = abs(Megaman_60_shift);
% correccione con transformada logaritmica
Megaman_Log = Megaman_c*log(1+Megaman_Abs);
Megaman_45_Log = Megaman_c*log(1+Megaman_45_Abs);
Megaman_60_Log = Megaman_c*log(1+Megaman_60_Abs);
%visualizacion de magnitud
figure()
imshow(Megaman_Abs,[]);
figure()
imshow(Megaman_45_Abs,[]);
figure()
imshow(Megaman_60_Abs,[]);
% visualizaciones de la correcion
figure()
imshow(Megaman_Log,[]);
figure()
imshow(Megaman_45_Log,[]);
figure()
imshow(Megaman_60_Log,[]);