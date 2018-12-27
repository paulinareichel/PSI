%%
close all; clear all; clc;
WEJSCIE = iris_dataset; %dane wejsciowe
size(WEJSCIE); %okreslenie rozmiaru tablicy
plot(WEJSCIE(1, :), WEJSCIE(2, :), 'b.', WEJSCIE(3, :),WEJSCIE(4, :), 'g.');
hold on; grid on; %do wyœwietlenia (trzymanie wykresu i siatka)
% PARAMETRY SIECI KOHONENA
dimensions = [10 10]; %wymiar wektora
coverSteps = 100; %liczba kroków szkoleniowych dla pocz¹tkowego pokrycia przestrzeni wejœciowej
initNeighbor = 0; %pocz¹tkowy rozmiar s¹siedztwa
topologyFcn = 'hextop'; %funkcja topologii warstw
distanceFcn = 'dist'; %funkcja odleg³oœci neuronowej
% TWORZENIE SIECI KOHONENA
net = selforgmap(dimensions, coverSteps, initNeighbor,topologyFcn, distanceFcn);
net.trainParam.epochs = 700;% ustalenie maksymalnej liczby epok treningowych utworzonej sieci
% TRENING SIECI
[net, tr] = train(net, WEJSCIE);
y = net(WEJSCIE);
grid on