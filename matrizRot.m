%% retorna uma matriz de rotaca para a sequencia especificada
function [M,R] = matrizRot(um,dois,tres)

syms roll pitch yaw;
R(:,:,1) = [1 0 0;
      0 cos(roll) sin(roll);
      0 -sin(roll) cos(roll)];

R(:,:,2) =[cos(pitch) 0 -sin(pitch);
    0 1 0;
    sin(pitch) 0 cos(pitch)];

R(:,:,3) =[cos(yaw) sin(yaw) 0;
      -sin(yaw) cos(yaw) 0;
      0 0 1];
  
M = R(:,:,tres)*R(:,:,dois)*R(:,:,um);  
end