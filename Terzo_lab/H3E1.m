%% Funzioni
spettro_di_energia = @(X) abs(X).^2;

%% Variabili principali
[x, Fs] = audioread("Fragments_of_Time.wav");
x = x(:, 1); 
T = 0.2; % ampiezza porta

% Crea il segnale rettangolare (porta) di ampiezza T
t = linspace(0, T, T*Fs);
porta = rectpuls(t);

% Segnale filtrato tramite porta
x_filtered = conv(x, porta);

spettro_x = spettro_di_energia(x);
spettro_x_filtered = spettro_di_energia(x_filtered);

t_f = linspace(0, length(x_filtered)/Fs, length(x_filtered));
t_x = linspace(0, length(x)/Fs, length(x));

XFF = fft(x_filtered); % dft uscita
XFI = fft([x' zeros(length(x_filtered) - length(x), 1)']'); % dft ingresso
HF = fftshift(XFF ./ XFI);


% Plot del segnale
plot(t, porta);
title('Segnale Porta');
xlabel('Tempo (s)');
ylabel('Ampiezza');
grid on;

plot(t_f, HF);
title('Funzione di trasferimento H(f)');
xlabel('Frequenza Hz');
ylabel('Ampiezza');
grid on;

% Plot del segnale di input e del segnale filtrato
figure;
subplot(2,1,1);
plot(t_x, x);
title('Segnale di Input');
xlabel('Tempo (s)');
ylabel('Ampiezza');

subplot(2,1,2);
plot(t_f, x_filtered);
title('Segnale Filtrato');
xlabel('Tempo (s)');
ylabel('Ampiezza');

% Plot dello SPETTRO del segnale di input e del segnale filtrato
figure;
subplot(2,1,1);
plot(t_x, spettro_x);
title('Spettro Segnale di Input');
xlabel('Tempo (s)');
ylabel('Ampiezza');

subplot(2,1,2);
plot(t_f, spettro_x_filtered);
title('Spettro Segnale Filtrato');
xlabel('Tempo (s)');
ylabel('Ampiezza');