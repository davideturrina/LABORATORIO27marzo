clear

% Leggi il file CSV e la foto

im = imread('EncDataLab_ANT_LE_50_BUCO1.png');
data = readmatrix('EncDataLab_ANT_LE_50_BUCO1_1.csv');
data2 = readmatrix('EncDataLab_ANT_LE_50_BUCO1_2.csv'); 
% Estrai colonne
x1 = data(7000:12000,1); % prima colonna
y1 = data(7000:12000,2); % seconda colonna
x2 = data2(7000:12000,1); % prima colonna
y2 = data2(7000:12000,2); % seconda colonna

figure(11),imagesc(im)
% Crea il plot
figure(121);
plot(x1,y1,x2,y2)

% Aggiungi etichette degli assi
xlabel('X')
ylabel('Y')

% Aggiungi titolo al grafico
title('EncDataLab_ANT_LE_50_BUCO 1 e 2')

% Aggiungi griglia
grid on
grid on





