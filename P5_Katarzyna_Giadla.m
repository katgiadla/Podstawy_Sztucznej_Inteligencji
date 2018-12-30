close all; clear all; clc;

in_value = iris_dataset; %danymi wej�ciowymi jest
% zbi�r danych, gdzie w I i II kolumnie mamy dane o d�ugo�ci
% i szeroko�ci dzia�ki kielicha, a w III i IV kolumnie
% o d�ugo�ci i szeroko�ci p�atka (wszystkie wymiary podane s� w cm)

plot(in_value(1, :) ,in_value(2, :), 'b.', in_value(3, :), in_value(4, :), 'g.');
% narysowanie dwuwymiarowego wykresu zale�no�ci 
% d�ugo�ci od szeroko�ci
hold on; grid on; %hold - zapami�tanie aktualnego wykresu,
% kiedy tworz� si� inne wykresy
% grid - wy�wietlanie linii siatek wykresu

dimensions = [12 12]; % wymiary wektora  
coverstep = 60; %etapy szkolenia w celu pokrycia przestrzeni wej�ciowej
initNeighbor = 5; % wej�ciowy rozmiar s�siedztwa
topologyFcn = 'hextop'; %funkcja topologiczna -> kszta�t, jaki b�d� przyjmowa� nasze dane
% mog� przyjmowa� kszta�t tr�jk�ta, siatek kwadratowych, sze�ciok�t�w, itp.
distanceFcn = 'dist'; %funkcja dystansu neron�w - miara euklidesowa (znormalizowana)
% domy�lnym parametrem jest odleg�o�� mi�dzy neuronami warstwy z
% uwzglednieniem ich po�o�enia

net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn); %tworzenie mapy samoorganizacji 
net.trainFcn = 'trainbu'; %uczenie bez nauczyciela
net.trainParam.epochs = 600;
[net, tr] = train(net, in_value); %trening sieci
y = net(in_value); %testowanie i zapis wynik�w osi�gni�tych przez sie�