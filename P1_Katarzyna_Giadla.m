close all; clear all; clc;

%%bramka AND
net = newp([0 1; 0 1], 1, 'hardlim'); %generowanie nowego neutronu
dane_in = [0 0 1 1;
           0 1 0 1];
dane_out = [0 1 1 1]; %dane_in, dane_out - wzorce uczenia
plotpv(dane_in, dane_out) %wy�wietlanie wykresu danych wej�ciowych i wyj�ciowych

net.trainParam.epochs = 12; %ilo�� cykli (epok) uczenia
net.trainParam.goal = 0.005; %pr�g osi�gni�cia celu
net.trainParam.mu = 0.01; %b��d �redniokwaratowy
%net.trainParam.showWindow = false; - wyswietlanie interfejsu GUI

net = train(net, dane_in, dane_out); %proces uczenia
plotpc(net.iw{1, 1}, net.b{1}) %wykres stworzony z kom�rek pami�ci, w k�rych by�y przechowywane wagi wej�ciowe oraz odchylenie b

Y = sim(net, dane_in); %test - czy perceptron nauczy� si�
test = randi([0 1], 2, randi([2, 5])); %generowane losowe wart. logiczne z 2 wierszami i losow� liczb� kolumn (<=5)
efekt = sim(net, test); %wy�wietlenie wynik�w tego, co nauczy� si� perceptron

test
efekt