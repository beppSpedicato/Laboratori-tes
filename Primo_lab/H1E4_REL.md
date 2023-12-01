# Relazione Esercizio 4

## Introduzione
L'esercizio prevede di confrontare due segnali con uno di riferimento e stabilire quale dei due è più simile al riferimento, utilizzando
due metodi differenti.

## Variabii Principali
Per provare vengono usati tre file audio, campionati a frequenza fs
```matlab
fs = 44100;
x1 = audioread('three_noise.wav');
x2 = audioread('four_noise.wav');
xref = audioread('three_ref.wav');
```
