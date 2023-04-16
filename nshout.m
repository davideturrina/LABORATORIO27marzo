
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



% converto il segnale in un treno di onde quadre
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

fs=20000 % frequenza di campionamento

%Calcola la differenza di fase tra i segnali x e y usando la funzione atan2(y,x) che restituisce l'angolo in radianti
%phase_diff = atan2(sq1_norm,x1_norm);
%Calcolo la derivata temporale dell'angolo usando la funzione diff() e lo moltiplico per la frequenza così ottengo radianti al secondo
%d_phase = diff(phase_diff) *fs;
%zero_crossings = find(sign(d_phase(1:end-1)) ~= sign(d_phase(2:end)));
%wave_counts = diff(zero_crossings) / 2;
%time = zero_crossings(1:end-1) / fs;
%plot(time, wave_counts);
%xlabel('Tempo (s)');
%ylabel('Conteggio per fronte d''onda');












