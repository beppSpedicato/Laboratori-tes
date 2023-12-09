% audioread mi da la frequenza di campionamento del segnale
[x, fc] = audioread("Fragments_of_Time.wav");

% calcolo esplicito della DFT, poi ne faccio il modulo quadro per trovare
% lo spettro di energia

M = 40;                 % durata sottofinestre temporali
n_fin = floor(length(x) / (M * fc)); 
% mi devo calcolare il numero di finestre temporali.
% floor(A) approssima al primo intero più vicino <= ad A. length(x)/fc e'
% la lunghezza in secondi del file. numCamp = durata/ Tc, con Tc = 1/fc,
% ogni quanto campiono il segnale, e numCamp e' length(x). divido poi la
% durata in secondi per la grandezza della finestra per sapere quante
% finestre ho.

for i = n_fin
% start_fin e end_fin sono gli # esimi campioni in cui comincia/finisce la
% finestra
    start_fin = (i - 1) * M * fc + 1;
% M*fc e' il numero di campioni nella finestra di M secondi. Moltiplicarlo
% per i-1 mi mette alla fine della scorsa finestra, il +1 alla fine mi
% mette nel primo campione della finestra corrente
    end_fin = i * M * fc;

    sub_fin = x(start_fin : end_fin);
% la mia sottofinestra. Qui sotto inizio il calcolo della dft
% metodo 1: manualmente

    N = length(sub_fin);
    X = zeros(1, N);        % qui mettero' la mia dft

    for k = 1:N
        for n = 1:N
            X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
        end
    end

% lo spettro di energia e' il modulo quadro della dft
    SE1 = abs(X).^2;

    %figure
    %set (gca, 'Fontsize', 14);
    %stem()







end

