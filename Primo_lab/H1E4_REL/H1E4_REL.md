# Relazione Esercizio 4

## Introduzione
L'esercizio prevede di confrontare due segnali con uno di riferimento e stabilire quale dei due è più simile al riferimento, utilizzando
due metodi differenti.

## Variabili Principali
Per provare vengono usati tre file audio, campionati a frequenza ```fs```
```matlab
fs = 44100;
x1 = audioread('three_noise.wav');
x2 = audioread('four_noise.wav');
xref = audioread('three_ref.wav');
```

## Metodo 1

In questo l'obiettivo è quello di trovare il segnale xn tale per cui ```en = an.*xn - xref``` ha energia minore, dove ```an``` è trovato risolvendo ```sum(abs(an.*xn).^2) = sum(abs(xref).^2)``` .

```matlab
%% inizio metodo 1
% Calcolo energia dei segnali
e_x1 = sum(abs(x1).^2);
e_x2 = sum(abs(x2).^2);
e_xref = sum(abs(xref).^2);

% Calcolo parametri per normalizzare
a1 = sqrt(e_xref / e_x1);
a2 = sqrt(e_xref / e_x2);

e1 = a1.*x1 - xref;
e2 = a2.*x2 - xref;

% Calcolo energia dei segnali normalizzati
e_e1 = sum(abs(e1).^2);
e_e2 = sum(abs(e2).^2);

disp('1° Metodo:');
if e_e1 < e_e2
    disp('X1 è più simile a Xref');
else
   disp('X2 è più simile a Xref');
end
%% fine metodo 1
```

In questo caso guardando i grafici di ```e1``` ed ```e2``` possiamo notare la differenza di energia:

![Alt text](./grafico%20e1.png "grafico e1")
![Alt text](./grafico%20e2.png "grafico e2")

Possiamo perciò stabilire che x1 ('three_noise.wav') è più simile a xref ('three_ref.wav').

## Metodo 2

Il secondo metodo invece prende in considerazione l'autocorrelazione del segnale di riferimento e le cross_correlazioni tra xref e i segnali xn. Vengono perciò svolti i calcoli del metodo 1 ma su queste nuove variabili, prendendo in considerazione il segnale xn per il quale la differenza fra la cross-correlazione normalizzata e l'autocorrelazione di xref sia minore. 

```matlab
%% inizio metodo 2
% Calcolo autocorrelazione e cross-correlazioni
R_ref = xcorr(xref);
R_c1 = xcorr(xref,x1);
R_c2 = xcorr(xref,x2);

% Calcolo energia delle correlazioni
E_rref = sum(abs(R_ref).^2);
E_rc1 = sum(abs(R_c1).^2);
E_rc2 = sum(abs(R_c2).^2);

% Calcolo coefficienti per normalizzare
ac1 = sqrt(E_rref / E_rc1);
ac2 = sqrt(E_rref / E_rc2);

R_c1cap = ac1.*R_c1 - R_ref;
R_c2cap = ac2.*R_c2 - R_ref;

% Calcolo energia delle correlazioni normalizzate
e_rc1cap = sum(abs(R_c1cap).^2);
e_rc2cap = sum(abs(R_c2cap).^2);

disp('2° Metodo:');
if e_rc1cap < e_rc2cap
    disp('X1 è più simile a Xref');
else
   disp('X2 è più simile a Xref');
end

%% fine metodo 2
```

![Alt text](./grafico%20R_c1cap.png "grafico R_c1cap")
![Alt text](./grafico%20R_c2cap.png "grafico R_c2cap")

In questo caso possiamo notare come la differenza fra le due energia sia nettamente evidente, ottenendo così lo stesso risultato del primo esercizio.
