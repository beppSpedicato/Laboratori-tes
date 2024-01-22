%% Segnali in ingresso
[x, Fs] = audioread("Fragments_of_Time.wav");
x = x(:, 1); 
N = 1;
rumore_bianco = randn(length(x),N);

%% Porta nel tempo
T = 2; % ampiezza porta nel tempo

% Crea il segnale rettangolare (porta) di ampiezza T
t = linspace(0, T);
porta = rectpuls(t);

x_filtered_pt = H3base(x, porta, Fs, "PORTA nel TEMPO");

%% Porta in frequenza
F = 70000; % ampiezza porta in frequenza

% Crea il segnale rettangolare (porta) di ampiezza T
tf = linspace(-length(x), length(x));
portaf = sin(pi*F.*tf)./(pi.*tf);

x_filtered_pf = H3base(x, portaf, Fs, "PORTA in Frequenza");

%% Rumore Bianco
for i = 1:N
    H3base(rumore_bianco(i), porta, Fs, "Porta in t con rumore");
    H3base(rumore_bianco(i), portaf, Fs, "Porta in freq con rumore");
end

%% Ascolto segnali filtrati
% sound(x_filtered_pt);
% sound(x_filtered_pf);
