close all; clear all; clc;

in_value = iris_dataset; %danymi wejœciowymi jest
% zbiór danych, gdzie w I i II kolumnie mamy dane o d³ugoœci
% i szerokoœci dzia³ki kielicha, a w III i IV kolumnie
% o d³ugoœci i szerokoœci p³atka (wszystkie wymiary podane s¹ w cm)

plot(in_value(1, :) ,in_value(2, :), 'b.', in_value(3, :), in_value(4, :), 'g.');
% narysowanie dwuwymiarowego wykresu zale¿noœci 
% d³ugoœci od szerokoœci
hold on; grid on; %hold - zapamiêtanie aktualnego wykresu,
% kiedy tworz¹ siê inne wykresy
% grid - wyœwietlanie linii siatek wykresu

dimensions = [12 12]; % wymiary wektora  
coverstep = 60; %etapy szkolenia w celu pokrycia przestrzeni wejœciowej
initNeighbor = 5; % wejœciowy rozmiar s¹siedztwa
topologyFcn = 'hextop'; %funkcja topologiczna -> kszta³t, jaki bêd¹ przyjmowaæ nasze dane
% mog¹ przyjmowaæ kszta³t trójk¹ta, siatek kwadratowych, szeœciok¹tów, itp.
distanceFcn = 'dist'; %funkcja dystansu neronów - miara euklidesowa (znormalizowana)
% domyœlnym parametrem jest odleg³oœæ miêdzy neuronami warstwy z
% uwzglednieniem ich po³o¿enia

net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn); %tworzenie mapy samoorganizacji 
net.trainFcn = 'trainbu'; %uczenie bez nauczyciela
net.trainParam.epochs = 600;
[net, tr] = train(net, in_value); %trening sieci
y = net(in_value); %testowanie i zapis wyników osi¹gniêtych przez sieæ