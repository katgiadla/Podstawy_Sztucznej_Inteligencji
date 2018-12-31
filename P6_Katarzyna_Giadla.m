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

dimensions = [12 12]; % wymiary wektora wyjœciowego -> iloœæ neuronów i mo¿liwoœci cech 
coverstep = 50; %etapy szkolenia w celu pokrycia przestrzeni wejœciowej
initNeighbor = 3; % wejœciowy rozmiar s¹siedztwa
topologyFcn = 'hextop'; %funkcja topologiczna -> kszta³t, jaki bêd¹ przyjmowaæ nasze dane
% mog¹ przyjmowaæ kszta³t trójk¹ta, siatek kwadratowych, szeœciok¹tów, itp.
distanceFcn = 'dist'; %funkcja dystansu neronów - miara euklidesowa (znormalizowana)
% domyœlnym parametrem jest odleg³oœæ miêdzy neuronami warstwy z
% uwzglednieniem ich po³o¿enia

net = selforgmap(dimensions, coverstep, initNeighbor, topologyFcn, distanceFcn); %tworzenie mapy samoorganizacji 
net.trainFcn = 'trainbu'; %uczenie bez nauczyciela
net.trainParam.epochs = 600;
net.trainParam.lr = 0.5; %wspó³czynnik uczenia
[net, tr] = train(net, in_value); %trening sieci
y = net(in_value); %testowanie i zapis wyników osi¹gniêtych przez sieæ
indexOfOutput = vec2ind(y); % wskaŸniki, do którego neuronu podobny jest dany neutron 