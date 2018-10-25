close all; clear all; clc;

%%bramka AND
net = newp([0 1; 0 1], 1, 'hardlim'); %generowanie nowego neutronu
dane_in = [0 0 1 1;
           0 1 0 1];
dane_out = [0 1 1 1]; %dane_in, dane_out - wzorce uczenia
plotpv(dane_in, dane_out) %wyœwietlanie wykresu danych wejœciowych i wyjœciowych

net.trainParam.epochs = 12; %iloœæ cykli (epok) uczenia
net.trainParam.goal = 0.005; %próg osi¹gniêcia celu
net.trainParam.mu = 0.01; %b³¹d œredniokwaratowy
%net.trainParam.showWindow = false; - wyswietlanie interfejsu GUI

net = train(net, dane_in, dane_out); %proces uczenia
plotpc(net.iw{1, 1}, net.b{1}) %wykres stworzony z komórek pamiêci, w kórych by³y przechowywane wagi wejœciowe oraz odchylenie b

Y = sim(net, dane_in); %test - czy perceptron nauczy³ siê
test = randi([0 1], 2, randi([2, 5])); %generowane losowe wart. logiczne z 2 wierszami i losow¹ liczb¹ kolumn (<=5)
efekt = sim(net, test); %wyœwietlenie wyników tego, co nauczy³ siê perceptron

test
efekt