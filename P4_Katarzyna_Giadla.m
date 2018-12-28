close all; clear all; clc;

start = [0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1;
    0 1; 0 1; 0 1; 0 1; 0 1]; %format danych wejœciowych

out_s = 25; %iloœæ wyjœæ z sieci

net = newff(start, out_s, {'tansig'}, 'trainlm', 'learnh'); %stworzenie prostej sieci
%pos³uguj¹cej siê tangesem hiperbolicznym jako funkcj¹ aktywacji, algorytm wstecznej propagacji 

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
net.trainParam.goal = 0.001; %b³¹d œredniokwadratowy
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

efektHebba = wagiHebba; %zapisanie pierwotnych wspó³czynników Hebba

efekt = sim(net, in_value); %test sieci

% disp('Wspó³czynniki Hebba: ')
% disp(':) = '), disp(sum(efektHebba(1, ':')));
% disp(':( = '), disp(sum(efektHebba(2, ':')));
% disp(':P = '), disp(sum(efektHebba(3, ':')));
% disp(':D = '), disp(sum(efektHebba(4, ':')));

disp('Dzia³anie algorytmu z wykorzystaniem regu³y Hebba: ')
disp(':) = '), disp(sum(efekt(:, 1)));
disp(':( = '), disp(sum(efekt(:, 2)));
disp(':P = '), disp(sum(efekt(:, 3)));
disp(':D = '), disp(sum(efekt(:, 4)));