clear all
close all
clc

n = [-15:15];
f = @(n) 5.*cos((5.*pi.*n)./3);

y = f(n);

figure
set(gca,'FontSize',14)
stem(n,y,'b')
xlabel('n')
ylabel('5.*cos((5.*pi.*n)./3)')
axis([-15 15 -15 15])
grid on
