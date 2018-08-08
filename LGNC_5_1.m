clc; clear all; close all;
format short; format compact; digits(4);

% cira as variaveis simbolicas
syms roll pitch yaw;

%% retorna matriz simbolica de rotacao 1-3-2
[A132,R] = matrizRot(1,3,2);

disp('matriz simbolica:')
A132
disp(' ')
disp('submatrizes simbolicas')
disp(R)
disp(' ')

disp('para os angulos(em graus):')
roll_ = 45
pitch_ = 33
yaw_ = -269

%% substitui valores na expressão simbolica
A132 = vpa(subs(A132, {roll pitch yaw}, {deg2rad(roll_)  deg2rad(pitch_) deg2rad(yaw_)}))

%% imprime matrizes de rotacao matrizes de rotação
R(:,:,1) = vpa(subs(R(:,:,1), deg2rad(roll_)));
R(:,:,2) = vpa(subs(R(:,:,2), deg2rad(pitch_)));
R(:,:,3) = vpa(subs(R(:,:,3), deg2rad(yaw_)));
R

%% problema 1
% vetores inerciais
disp(' ')
disp('vetores inerciais:')
r1i = [1 1 1]'
r2i = [-1 -1 1]'

% versores inerciais
disp(' ')
disp('versores inerciais:')
r1i = vpa(r1i/norm(r1i))
r2i = vpa(r2i/norm(r2i))

% versores no sistema do corpo
disp(' ')
disp('versores no sistema do corpo:')
r1b = A132*r1i
r2b = A132*r2i

%% matriz de atitude pelo metodo TRIAD
disp(' ')
disp('matriz de atitude pelo metodo TRIAD')
Rbi_TRIAD = triad(r1b,r1i,r2b,r2i)

%% recuperacao dos angulos de euler
%%angulos de rolamento, arfagem e guinada
disp(' ')
disp('angulos de rolamento, arfagem e guinada')
% recupera os angulos de Euler para uma matriz 132
[roll, pitch, yaw] = recuperaAngulos132(Rbi_TRIAD)
