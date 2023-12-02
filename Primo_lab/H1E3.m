
%% esercizio 3.a
n = -10:10;
x = exp(-n).* (n>= 0);  %qui parto dalla funzione exp(-n) e la moltiplpico per
                        % un vettore booleano che vale
                        % 1 solo quando n è maggiore uguale a 0. se n fosse
                        %[-5:5]

Energia1 = sum((abs(x)).^2)

figure('Name','1')
set(gca, 'FontSize', 18);
stem(n, x, 'b');
xlabel('n');
ylabel('x(n)');
title('e^-^n');
axis([-10 10 0 1.2]);
grid on;

% provo ad allargare il supporto per monitorare l'aumento dell' energia
n = -10:100;
x = exp(-n).* (n>= 0);

Energia2 = sum((abs(x)).^2)

figure('Name','2')
set(gca, 'FontSize', 18);
stem(n, x, 'b');
xlabel('n');
ylabel('x(n)');
title('e^-^n');
axis([-10 100 0 1.2]);
grid on;

% confrontando i valori di Energia1 = 1.5651 e di Energia2 = 1.5651, possiamo
% arrivare alla conclusione che questo segnale x(n) sia ad energia finita,
% dal momento che allargando il supporto del segnale il valore dell'energia
% ad esso associato è rimasto invariato

%% esercizio 3.b
n = -10:10;           
A = 5; % per esempio
x = A.*ones(21);

Energia1 = sum((abs(x)).^2)

figure('Name','1')
set(gca, 'FontSize', 18);
stem(n, x, 'r');
xlabel('n');
ylabel('x(n)');
title('x = A ');
axis([-10 10 0 10]);
grid on;

% risulta evidente che in questo caso il segnale, avendo andamento costante
% su un supporto infinito, avrà energia infinita, ma vediamo quanto essa 
% cambia allargando il supporto

n = -100:100;           
A = 5; % per esempio
x = A.*ones(201);

Energia2 = sum((abs(x)).^2)

figure('Name', '2')
set(gca, 'FontSize', 18);
stem(n, x, 'r');
xlabel('n');
ylabel('x(n)');
title('x = A ');
axis([-100 100 0 10]);
grid on;

% il valore Energia1 = 525 ed Energia2 = 5025 confermano l'ipotesi
% precedente. La rapida crescita dell'energia del segnale conferma che esso
% sia ad energia infinita. Verifichiamo allora quanto vale la potenza media
% di x, che risulta finita dal momento che la sua energia non lo è.
% Attraverso una serie di passaggi matematici applicati alla definizione di
% potenza media verifichiamo che:

N = 10e10;          % N deve tendere ad infinito 

Potenza = (1/(2*N + 1))*(2*N + 1)*(abs(x)).^2

%il segnale x ha una potenza media di valore A^2 = 25.

%% esercizio 3.c

n = -10 : 10;
A = 5;              % per esempio
N = 5;              % periodo della sinusoide
x = A.*exp(-(2*1i*pi.*n)./N);

% stampo la parte reale e immaginarie separate
figure  
set(gca, 'FontSize', 18);
stem(n, real(x), 'r');
xlabel('n');
ylabel('Re{x(n)}');
title('x = Ae^-^j^2^p^i^n^/^N ');
axis([-10 10 -10 10]);
grid on;

figure
set(gca, 'FontSize', 18);
stem(n, imag(x), 'r');
xlabel('n');
ylabel('Img{x(n)}');
title('x = Ae^-^j^2^p^i^n^/^N ');
axis([-10 10 -10 10]);
grid on;

% dal momento che l'energia tiene in considerazione il modulo quadro del 
% segnale, ci troviamo in un caso analogo al precedente; questo perchè il 
% modulo quadro dei due segnali è pari alla loro ampiezza A al quadrato.
% Questo valore sommato infinite volte porta senz'ombra di dubbio a una
% energia a sua volta infinita. 
% Questi due segnali avendo lo stesso modulo quadro condivideranno non solo
% il valore della loro energia, ma anche della loro potenza media, che
% anche in questo caso, come il precedenre, risulta finita ed uguale ad A^2

%% esercizio 3.d

n = -10:10;
A = 5;
x = A.*(n >= 0);

figure
set(gca, 'FontSize', 18);
stem(n, x, 'r');
xlabel('n');
ylabel('x(n)');
title('x = A*H(n) ');
axis([-10 10 0 10]);
grid on;

% questo segnale è estremamente simile a quello dell'esercizio 3.b, con la
% differenza di avere il supporto dimezzato. Questo aspetto però non
% scongiura il calcolo di una potenza infinita, in quanto il numero di
% volte che sto sommando A^2 risulta ancora infinito. Si procede dunque
% direttamente con il calcolo della potenza

N = 10e10;          % N deve tendere ad infinito 

Potenza = (1/(2*N + 1))*(N)*(abs(x)).^2

%il segnale x ha una potenza media di valore (A^2)/2 = 12.5 .

%% esercizio 3.e

n = -10: 10;
A = 5;
N = 3;
n_0 = 4;
x = A.* (abs(n-n_0)<=N);     % sto moltiplicando per un vettore booleano
                            %che vale 1 solo se mi trovo in quella
                            %condizione
           
Energia = sum((abs(x)).^2)

figure
set(gca, 'FontSize', 18);
stem(n, x, 'r');
xlabel('n');
ylabel('x(n)');
title(' x = A se |n - n_0| <= N ');
axis([-10 15 0 10]);
grid on;

% il segnale x essendo una funzione porta, ha un supporto finito, e,
% presentando solo valori finiti e costanti, possiede dunque una energia
% finita. Il suo valore, con i valori di n_0, N, ed A scelti in questo
% esempio, è pari a 175.
