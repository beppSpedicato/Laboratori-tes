close all
clear all
clc

%% costruisco x[n]
n=[-10:15];         %% quoto l'asse delle ascisse tra -10 e 15
x=[zeros(1,10),0:10,zeros(1,5)];   %% vettore di 26 campioni
figure(1)
stem(n,x,'blue','Linewidth',2)
xlabel('n','FontSize',18)
ylabel('x[n]','FontSize',18)
grid on

%% y1[n]=x[n+5]
y1=zeros(1,26);   %% vettore di 26 campioni (stessa lunghezza di x)

for i=-5:10
    y1(i+6)=x(i+11);
end
figure(2)

subplot(2,1,1)
stem(n,x,'blue','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('x[n]','FontSize',18)
grid on

subplot(2,1,2)
stem(n,y1,'red','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('y1[n]','FontSize',18)
grid on

%% y2[n]=x[-n+5]
y2=zeros(1,26);

for i=-5:10
    y2(i+11)=x(-i+16);
end
figure(3)

subplot(2,1,1)
stem(n,x,'blue','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('x[n]','FontSize',18)
grid on

subplot(2,1,2)
stem(n,y2,'red','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('y2[n]','FontSize',18)
grid on

%% y3[n]=x[2n]
y3=zeros(1,26);

for i=0:5
    y3(i+11)=x(2*i+11);
end
figure(4)

subplot(2,1,1)
stem(n,x,'blue','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('x[n]','FontSize',18)
grid on

subplot(2,1,2)
stem(n,y3,'red','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('y3[n]','FontSize',18)
grid on


%% y4[n]=x[n+10]+x[-n+10]-10𝛿[n]

y4_1=zeros(1,26);
y4_2=zeros(1,26);
y4_3=zeros(1,26);

for i=-10:0
    y4_1(i+11)=x(i+21);
end

for i=0:10
    y4_2(i+11)=x(-i+21);
end

y4_3(11)=-10;

figure(5)

%% non plottiamo x[n] affinché si veda bene y4[n]
%% rappresentiamo y4[n] plottando separatamente le 3 componenti y4_1, y4_2, y4_3
stem(n,y4_1,'red','LineWidth',2)
hold on
stem(n,y4_2,'green','LineWidth',2)
stem(n,y4_3,'magenta','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('y4[n]','FontSize',18)
grid on

%% plottiamo y4[n] come somma delle 3 componenti y4_1, y4_2, y4_3
y4=zeros(1,26);
y4 = y4_1 + y4_2 + y4_3;
figure(6)
stem(n,y4,'LineWidth',2)
xlabel('n','FontSize',18)
ylabel('y4[n]','FontSize',18)
grid on


%% scomporre x[n] nella somma di un segnale pari e uno dispari
x_p=zeros(1,26);    % segnale pari
x_d=zeros(1,26);    % segnale dispari

% costruisco il segnale pari
for i=-10:0
    x_p(i+11)=0.5*x(-i+11);
end

for i=0:10
    x_p(i+11)=0.5*x(i+11);
end

% costruisco il segnale dispari
for i=-10:0
    x_d(i+11)=-0.5*x(-i+11);
end

for i=0:10
    x_d(i+11)=0.5*x(i+11);
end

figure(7)

subplot(3,1,1)
stem(n,x_p,'blue','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('x_p[n]','FontSize',18)
grid on

subplot(3,1,2)
stem(n,x_d,'red','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('x_d[n]','FontSize',18)
grid on

subplot(3,1,3)
stem(n,x_d+x_p,'black','LineWidth',2)
xlabel('n','FontSize',18)
ylabel('x_d[n]','FontSize',18)
grid on



