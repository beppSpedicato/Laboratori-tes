%% Funzioni
dft = @(x, k, N) sum(x.*exp((-1i * 2 * pi * (k-1)).*(0:N-1)/ N));
spettro_di_energia = @(X) abs(X).^2;
print_exec_time = @(iter, exec_time, description) disp(['Tempo esecuzione ' description ' iterazione ' num2str(iter) ': ' num2str(exec_time) ' s']);

%% Variabili principali
[x, fc] = audioread("Fragments_of_Time.wav");
x = x(:, 1); % Se l'audio è di tipo 'stereo'
M = 0.5; % Durata sotto finestra in secondi         
numero_sotto_finestre = floor(length(x) / (fc * M)); 

for it = 1 : numero_sotto_finestre
    %% Calcolo Sotto finestra temporale
    inizio_finestra = (it - 1) * M * fc + 1;
    fine_finestra = it * M * fc;
    sotto_finestra = x(inizio_finestra : fine_finestra)';  

    %% Calcolo DFT
    tic;
        N = length(sotto_finestra);
        X_dft = zeros(1, N); 
        for k = 1:N
            X_dft(k) = dft(sotto_finestra, k, N);
        end
        spettro_dft = spettro_di_energia(fftshift(X_dft));
    exec_time_dft = toc;    

    %% Calcolo FFT
    tic;
        X_fft = fft(sotto_finestra);
        spettro_fft = spettro_di_energia(fftshift(X_fft));
    exec_time_fft = toc;

    %% Calcolo Errore
    errore = abs(spettro_dft - spettro_fft);
    errore_medio = sum(errore)/length(errore);
    disp(['Errore medio iterazione ' num2str(it) ' : ' num2str(errore_medio)])

    %% Grafico DFT, FFT, Errore
    figure_in_KHz(spettro_dft, fc, "DFT", "Spettro di energia DFT", "b");
    figure_in_KHz(spettro_fft, fc, "FFT", "Spettro di energia FFT", "r");
    figure_in_KHz(errore, fc, "Errore durante il calcolo della FFT", "Errore (DFT - FFT", "g");

    %% Valutazione tempi di esecuzione
    print_exec_time(it, exec_time_dft, 'dft');
    print_exec_time(it, exec_time_fft, 'fft');
end
