clc; clear all; close all;
format short;
format compact;
digits(4)

%% coodenadas em graus minutos e segundos [ascencao reta; declinacao]
disp('coordenadas inerciais das estrelas(Asceção reta e declinação):')
antares_i = [16 29 24.46; -26 25 55.21]
aldebaran_i = [4 35 55.24; 16 30 33.49];

disp(' ')
disp('coordenadas cartesianas inerciais:')
cart_antares_i = ICRS2Cart(antares_i)'
cart_aldebaran_i = ICRS2Cart(aldebaran_i)'

%% vetores medido no referencial do corpo
disp(' ')
disp('coordenadas cartesianas no referencial do corpo:')
cart_antares_b = [-0.1142 -0.6739 0.7300]'
cart_aldebaran_b = [0.2563 0.7236 -0.6408]'


%% utiliza o método TRIAD para obter a matriz de atitude
disp(' ')
disp('matriz de atitude pelo metodo TRIAD:')
Cbi_TRIAD = triad(cart_antares_b,cart_antares_i,cart_aldebaran_b,cart_aldebaran_i)

%% recuperacao dos angulos de euler
%%angulos de rolamento, arfagem e guinada
disp(' ')
disp('angulos de rolamento, arfagem e guinada')
% recupera os angulos de Euler para uma matriz 132
[roll, pitch, yaw] = recuperaAngulos132(Cbi_TRIAD)

