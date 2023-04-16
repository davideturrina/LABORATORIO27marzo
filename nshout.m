% Analisi
%dati
%•
%In Matlab
%–
%Usare load() per caricare i dati
%–
%Per normalizzare si consiglia
%function XN = norm1 (X)
%M = median(X);
%MAX = max(X);
%MIN = min(X);
%XN = (X
%M) / ((MAX MIN)/2);
% end 

%Matlab
%•
%Acquisisco i dati tramite Matlab utilizzando un
%file .csv
%•
%Vengono presentati tre sistemi di elaborazione
%del segnale:
%-
%conversione A/D
%-
%interpolazione canali A B
%-
%analisi e confronto dell%output(misurando) per
%i due encoders

%clc
%clear
%close
%all
%% CARICO I DATI
%cartellaDati
%= 'acquisizione'
%load
%sensori.csv;
%sensori = sensori(50000:end,:);
%limitazione estesa a tutte le
%colonne
%second
%=
%sensori(:,1);%campionamento
%temporale
%NORMALIZZAZIONE
%sottraggo al vettore ampiezza il
%suo valor medio
%=> valor medio nullo
%divido il vettore ampiezza per il
%suo valor massimo
%=>ampiezza unitaria
%PLOT
%Carico
%dati e normalizzazione

clear

% file CSV e la foto

im = imread('EncDataLab_ANT_LE_50_BUCO1.png');
data = readmatrix('EncDataLab_ANT_LE_50_BUCO1_1.csv');
data2 = readmatrix('EncDataLab_ANT_LE_50_BUCO1_2.csv'); 
% Estraggo le colonne
x1 = data(7000:12000,1); 
y1 = data(7000:12000,2); 
x2 = data2(7000:12000,1); 
y2 = data2(7000:12000,2); 

figure(11),imagesc(im)

% Crea il plot
figure(12);
plot(x1,y1,x2,y2)

% Aggiungi etichette, titoli etc..
xlabel('X')
ylabel('Y')

title('EncDataLab_ANT_LE_50_BUCO 1 e 2')

grid on
grid on

x1_norm = norm1(x1);
y1_norm = norm1(y1);

x2_norm = norm1(x2);

y2_norm = norm1(y2);

figure(13);
plot(x1_norm,y1_norm,x2_norm,y2_norm)


% calcolo la frequenza dell'onda quadra in base alla frequenza di
% campionamento (ho scelto fs    a caso)
 %  freq = 1/(2*(1/fs));

% converto il segnale 1 in un treno di onde quadre
%sq1 = square(2*pi*freq*(0:length(x1_norm)-1)',50);

% converto il segnale 2 in un treno di onde quadre
%sq2 = square(2*pi*freq*(0:length(x2_norm)-1)',50);

%figure(14);
%plot(sq1,y1_norm,sq2,y2_norm)


% calcolo la frequenza dell'onda quadra in base alla frequenza di campionamento
%fs = 15; % esempio di frequenza di campionamento di 100 Hz
%freq = 1/(2*(1/fs));

% converto il segnale in un treno di onde quadre DUTY CYCLE 0.5
sq1_norm = square(y1_norm);
sq2_norm = square(y2_norm);

% plotto il segnale originale e il treno di onde quadre
figure(3);
subplot(2,1,1);
plot(x1_norm,y1_norm,x2_norm,y2_norm);
xlabel('Tempo');
ylabel('Ampiezza');
title('segnale normalizzato');
subplot(2,1,2);
plot(x1_norm,sq1_norm,x2_norm,sq2_norm);
xlabel('Tempo');
ylabel('Ampiezza');
title('segnale a impulsi');





