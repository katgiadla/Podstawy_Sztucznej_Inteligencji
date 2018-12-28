close all; clear all; clc;

start = [0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1]; %format danych wej�ciowych

out_s = 25; %ilo�� wyj�� z sieci

net = newff(start, out_s, {'tansig'}, 'trainlm', 'learnh'); %stworzenie prostej sieci
%pos�uguj�cej si� tangesem hiperbolicznym jako funkcj� aktywacji, algorytm wstecznej propagacji 

in_value = [0 0 0 0;
            0 0 1 1;
            0 0 0 0;
            0 0 1 1;
            0 0 0 0;
            
            0 0 0 0;
            1 1 0 0;
            0 0 0 0;
            1 1 0 0;
            0 0 0 0;
            
            0 0 1 1;
            0 0 1 1;
            0 0 1 1;
            0 0 1 1;
            0 0 1 1;
            
            1 0 0 1;
            0 1 0 0;
            0 1 1 0;
            0 1 0 0;
            1 0 0 1;
            
            0 1 0 0;
            1 0 0 1;
            1 0 0 1;
            1 0 1 1;
            0 1 0 0];
        
out_value = [1 0 0 0; % :)
             0 1 0 0; % :(
             0 0 1 0; % :P
             0 0 0 1]; % :D

lp.dr = 0.5; %wsp. zapominania
lp.lr = 0.5; %wsp. uczenia dla wsp. Hebba

wagiHebba = learnh([], in_value, [], [], out_value, [], [], [], [], [], lp, []); %ustalenie wag Hebba

net.trainParam.epochs = 1000; %maks. liczba epok
net.trainParam.goal = 0.001; %b��d �redniokwadratowy
net.trainParam.lr = 0.1; %wsp. uczenia algorytmu

net = train(net, in_value, wagiHebba'); %uczenie danych

test_smile = [0;0;0;0;0;
              0;1;0;1;0;
              0;0;0;0;0;
              1;0;0;0;1;5
              0;1;1;1;0];

test_sad = [0;0;0;0;0;
            0;1;0;1;0;
            0;0;0;0;0;
            0;1;1;1;0;
            1;0;0;0;1];

test_tongue = [0;1;0;1;0;
               0;0;0;0;0;
               1;1;1;1;1;
               0;0;1;0;1;
               0;0;0;1;0];

test_bigSmile = [0;1;0;1;0;
                0;0;0;0;0;
                1;1;1;1;1;
                1;0;0;0;1;
                0;1;1;1;0];

efektHebba = wagiHebba; %zapisanie pierwotnych wsp�czynnik�w Hebba

efekt = sim(net, in_value); %test sieci

% disp('Wsp�czynniki Hebba: ')
% disp(':) = '), disp(sum(efektHebba(1, ':')));
% disp(':( = '), disp(sum(efektHebba(2, ':')));
% disp(':P = '), disp(sum(efektHebba(3, ':')));
% disp(':D = '), disp(sum(efektHebba(4, ':')));

disp('Dzia�anie algorytmu z wykorzystaniem regu�y Hebba: ')
disp(':) = '), disp(sum(efekt(:, 1)));
disp(':( = '), disp(sum(efekt(:, 2)));
disp(':P = '), disp(sum(efekt(:, 3)));
disp(':D = '), disp(sum(efekt(:, 4)));