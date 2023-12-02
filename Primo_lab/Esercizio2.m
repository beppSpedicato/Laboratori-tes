
%delta(n) + 2delta(n-1) + delta(n-2)

close all
clear all
clc

n=[-10:10];
%---------------------------------inizio x1
primaDelta = zeros(1,21);
primaDelta(11) = 1;                 % delta(n)

secondaDelta = zeros(1,21);
secondaDelta(12) = 2;               % 2delta(n-1). Ho messo 12 a causa della traslazione perchè il valore in posizione 11 corrisponderebbe a x = 0.

terzaDelta = zeros(1,21);
terzaDelta(13) = 1;                 % delta(n-2)

x1 = primaDelta + secondaDelta + terzaDelta;

figure
set(gca,'FontSize',14)
stem(n,x1,'b')
xlabel('n')
ylabel('delta(n) + 2delta(n-1) + delta(n-2)')
title('x1')
axis([-10 10 -0.5 3])
grid on

%----------------------------------fine x1

%----------------------------------inizio x2

primaDelta = zeros(1,21);
primaDelta(11) = 3;                             % 3delta(n)

x2 = primaDelta + secondaDelta + terzaDelta;

figure
set(gca,'FontSize',14)
stem(n,x2,'b')
xlabel('n')
ylabel('3delta(n) + 2delta(n-1) + delta(n-2)')
title('x2')
axis([-10 10 -0.5 4])
grid on

%----------------------------------fine x2

c = conv(x1,x2);

tmp = (length(c)-1)/2;
n = [-tmp:tmp];

figure
set(gca,'FontSize',14)
stem(n,c,'b')
xlabel('n')
ylabel('conv(x1,x2)')
title('convoluzione')
axis([-10 10 0 10])
grid on


