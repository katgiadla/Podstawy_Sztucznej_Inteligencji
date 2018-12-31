close all; clear all; clc;
            % A B C D E F G H I J K L M N O P R S T U
in_value = [  0 1 0 1 1 1 0 1 0 1 1 1 1 1 0 1 1 0 1 1;
              1 1 1 1 1 1 1 0 0 1 0 0 0 0 1 1 1 1 1 0;
              1 1 1 1 1 1 1 0 1 1 0 0 0 0 1 1 1 1 1 0;
              1 1 1 1 1 1 1 0 0 1 0 0 0 0 1 1 1 1 1 0;
              0 0 0 0 1 1 0 1 0 0 1 0 1 1 0 0 0 0 1 1;
              
              1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 0 1;
              0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0;
              0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
              0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0;
              1 1 1 1 0 0 0 1 0 1 0 0 1 1 1 1 1 0 0 1;
              
              1 1 1 1 1 1 1 1 0 0 1 1 1 1 1 1 1 1 0 1;
              0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0;
              0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 0;
              1 0 0 1 0 0 1 1 0 1 0 0 1 1 1 0 0 0 0 1;
              
              1 1 1 1 1 1 1 1 0 1 1 1 1 1 1 1 1 0 0 1;
              1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
              1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0;
              1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1 0 0 0;
              1 1 1 1 0 0 1 1 0 1 0 0 1 1 1 0 0 1 0 1;
              
              1 1 0 1 1 1 0 1 0 0 1 1 1 1 0 1 1 0 0 0;
              0 1 1 1 1 0 1 0 0 1 0 1 0 0 1 0 0 1 0 1;
              0 1 1 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 1 1;
              0 1 1 1 1 0 1 0 0 0 0 1 0 0 1 0 0 1 0 1;
              1 0 0 0 1 0 0 1 0 0 1 1 1 1 0 0 1 0 0 0];

dimensions = [12 12]; % wymiary wektora wyj�ciowego -> ilo�� neuron�w i mo�liwo�ci cech 
coverstep = 50; %etapy szkolenia w celu pokrycia przestrzeni wej�ciowej
initNeighbor = 3; % wej�ciowy rozmiar s�siedztwa
topologyFcn = 'hextop'; %funkcja topologiczna -> kszta�t, jaki b�d� przyjmowa� nasze dane
% mog� przyjmowa� kszta�t tr�jk�ta, siatek kwadratowych, sze�ciok�t�w, itp.
distanceFcn = 'dist'; %funkcja dystansu neron�w - miara euklidesowa (znormalizowana)
% domy�lnym parametrem jest odleg�o�� mi�dzy neuronami warstwy z
% uwzglednieniem ich po�o�enia

net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn); %tworzenie mapy samoorganizacji 
net.trainFcn = 'trainbu'; %uczenie bez nauczyciela
net.trainParam.epochs = 600;
net.trainParam.lr = 0.5; %wsp�czynnik uczenia
[net, tr] = train(net, in_value); %trening sieci
y = net(in_value); %testowanie i zapis wynik�w osi�gni�tych przez sie�
indexOfOutput = vec2ind(y); % wska�niki, do kt�rego neuronu podobny jest dany neutron 