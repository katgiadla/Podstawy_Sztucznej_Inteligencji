close all; clear all; clc;

wart_in = [0 1; 0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;
0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1]; %wart_ in - jakie warto�ci mo�e przyjmowa� w�ze� wej�ciowy 
% -> poniewa� nasze obrazy przyjmuj� rozmiar 5x5, 
%zatem w�ze� wej�ciowy mo�e przyj�� 25 warto�ci 0 lub 1 
%ustawione pionowo

wart_out = 1; %ilo�� wyj�� z sieci

%metoda 1 - perceptron
%net = newp(wart_in, wart_out);
%metoda 2 - tworzenie sieci jednowarstwowej 
net = newlin(wart_in, wart_out, 0, 0.01);

%kolumnowa reprezentacja binarna ka�dej litery
          % A a B b C c D d E e F f H h I i K k L l
Learn_in = [0 0 1 1 1 0 1 0 1 0 1 0 1 1 1 1 1 1 1 1;
            1 1 1 0 1 0 1 0 1 1 1 1 0 0 0 0 0 0 0 0;
            1 1 1 0 1 0 1 0 1 1 1 1 0 0 0 0 0 0 0 0;
            1 0 0 0 1 0 0 1 1 0 1 0 0 0 0 0 1 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
            
            1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 1 1 1 1;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
            1 1 1 0 0 0 1 1 0 1 0 0 0 0 0 0 0 0 0 0;
            1 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0;
            
            1 0 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1 1 1;
            0 1 1 1 0 1 0 1 1 1 1 1 1 1 0 0 1 0 0 0;
            0 1 1 1 0 1 1 1 1 1 1 1 1 1 0 0 0 1 0 0;
            0 1 0 0 0 0 1 1 0 0 0 0 1 1 0 0 0 0 0 0;
            1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
            
            1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
            1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
            1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0;
            1 1 1 1 0 0 1 1 0 0 0 0 0 1 0 0 0 0 0 0;
            1 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0;
            
            1 0 1 1 1 1 1 0 1 0 1 1 1 1 1 1 1 1 1 1;
            0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 1 1;
            0 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 1 1 1;
            0 1 0 0 1 0 0 1 1 0 0 0 0 1 0 0 1 0 1 0;
            1 1 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0];

Learn_out = [1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0]; % 1 - du�a litera, 0 - ma�a litera

net.name = 'Wielkosc liter';

net.trainParam.epochs = 30000;
net.trainParam.goal = 0.001; %b��d �redniokwadratowy
net.trainParam.mu = 0.01; %nie jest potrzebna w metodzie 2, gdzie
%okre�lili�my wsp�czynnik uczenia
%net.trainParam.showWindow = false;

net = train(net, Learn_in, Learn_out); %uczenie sieci

%litery do testu

test_A = [0;1;1;1;0; 
          1;0;0;0;1; 
          1;0;0;0;1; 
          1;1;1;1;1; 
          1;0;0;0;1];
test_a = [0;1;1;0;0; 
          0;0;0;1;0; 
          0;1;1;1;0; 
          1;0;0;1;0; 
          0;1;1;1;1];
test_B = [1;1;1;0;0;  
          1;0;0;1;0; 
          1;1;1;0;0; 
          1;0;0;1;0; 
          1;1;1;0;0];
test_b = [1;0;0;0;0; 
          1;0;0;0;0; 
          1;1;1;0;0; 
          1;0;0;1;0; 
          1;1;1;0;0];
test_C = [1;1;1;1;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;1;1;1;0];
test_c = [0;0;0;0;0; 
          0;0;0;0;0; 
          0;1;1;0;0; 
          1;0;0;0;0; 
          0;1;1;0;0];
test_D = [1;1;1;0;0; 
          1;0;0;1;0; 
          1;0;0;1;0; 
          1;0;0;1;0; 
          1;1;1;0;0];
test_d = [0;0;0;1;0; 
          0;0;0;1;0; 
          0;1;1;1;0; 
          1;0;0;1;0; 
          0;1;1;1;0];
test_E = [1;1;1;1;0; 
          1;0;0;0;0; 
          1;1;1;0;0; 
          1;0;0;0;0; 
          1;1;1;1;0];
test_e = [0;1;1;0;0; 
          1;0;0;1;0; 
          1;1;1;0;0; 
          1;0;0;0;0; 
          0;1;1;0;0];
test_F = [1;1;1;1;0; 
          1;0;0;0;0; 
          1;1;1;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0];
test_f = [0;1;1;0;0; 
          1;0;0;0;0; 
          1;1;1;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0];
test_H = [1;0;0;0;1; 
          1;0;0;0;1;
          1;1;1;1;1; 
          1;0;0;0;1; 
          1;0;0;0;1];
test_h = [1;0;0;0;0; 
          1;0;0;0;0; 
          1;1;1;1;0; 
          1;0;0;1;0; 
          1;0;0;1;0];
test_I = [1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0];
test_i = [1;0;0;0;0; 
          0;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0];
test_K = [1;0;0;1;0; 
          1;0;1;0;0; 
          1;1;0;0;0; 
          1;0;1;0;0; 
          1;0;0;1;0];
test_k = [1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;1;0;0; 
          1;1;0;0;0; 
          1;0;1;0;0];
test_L  = [1;0;0;0;0; 
           1;0;0;0;0; 
           1;0;0;0;0; 
           1;0;0;0;0; 
           1;1;1;1;0];
test_l = [1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;0;0;0;0; 
          1;1;1;0;0];
      
efekt1 = sim(net, test_A); %test sieci
efekt2 = sim(net, test_a); 

[efekt1 efekt2]

if round(efekt1) <= 0 %zaokr�glenie
    disp('Ma�a litera');
else
    disp('Wielka litera');
end    

if round(efekt2) <= 0
    disp('Ma�a litera');
else
    disp('Wielka litera');
end   