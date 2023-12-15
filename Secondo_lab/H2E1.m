% audioread mi da la frequenza di campionamento del segnale
[x, fc] = audioread("Fragments_of_Time.wav");
% Sovrascrivo x selezionando solo il primo canale, dal momento che era
% stereo
x = x(:, 1);

% calcolo esplicito della DFT, poi ne faccio il modulo quadro per trovare
% lo spettro di energia

M = 0.5;                 % durata in secondi di ogni sottofinestra temporale
n_fin = floor(length(x) / (fc * M)); 
% mi devo calcolare il numero di finestre temporali.
% floor(A) approssima al primo intero più vicino <= ad A. length(x)/fc e'
% la lunghezza in secondi del file. numCamp = durata/ Tc, con Tc = 1/fc,
% ogni quanto campiono il segnale, e numCamp e' length(x). divido poi la
% durata in secondi per la grandezza della finestra per sapere quante
% finestre ho.

for i = 1 : 1
% start_fin e end_fin sono gli # esimi campioni in cui comincia/finisce la
% finestra
    start_fin = (i - 1) * M * fc + 1;
% M*fc e' il numero di campioni nella finestra di M secondi. Moltiplicarlo
% per i-1 mi mette alla fine della scorsa finestra, il +1 alla fine mi
% mette nel primo campione della finestra corrente
    end_fin = i * M * fc;

    sub_fin = x(start_fin : end_fin)';  % lo traspongo altrimenti viene colonna

% la mia sottofinestra. Qui sotto inizio il calcolo della dft
% metodo 1: manualmente

    N = length(sub_fin);
    X = zeros(1, N);        % qui mettero' la mia dft

    for k = 1:N
        
            X(k) = sum(sub_fin.* exp((-1i * 2 * pi * (k-1)) .* (0:N-1) / N));

            
            %disp(['iterazione ' num2str(k) ' di ' num2str(N)]);

        
    end

% lo spettro di energia e' il modulo quadro della dft
    SE1 = abs(fftshift(X)).^2;

    figure('Name','1')
    set(gca, 'FontSize', 19);
    stem(1:length(X), SE1, 'b');
    xlabel('k');
    ylabel('spettro di energia');
    title('DFT a manina');
    
    grid on;
    

    SE2 = abs(fftshift(fft(sub_fin))).^2;
    figure('Name','1')
    set(gca, 'FontSize', 19);
    stem(1:length(X), SE2, 'r');
    xlabel('k');
    ylabel('spettro di energia');
    title('FFT non a manina');
    
    grid on;


    diff = abs(SE1 - SE2);
    figure('Name','1')
    set(gca, 'FontSize', 19);
    stem(1:length(X), diff, 'g');
    xlabel('k');
    ylabel('differenza spettri');
    title('grafico errore');
    
    grid on;


end




