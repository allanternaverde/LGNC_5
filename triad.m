% determinacao da matriz de atitude R utilizando o algoritmo TRIAD
function [R_bi] = triad(s_b,s_i,m_b,m_i)

% considerando os vetores s e m

% normalizacao
s_b = s_b/norm(s_b);
s_i = s_i/norm(s_i);
m_b = m_b/norm(m_b);
m_i = m_i/norm(m_i);

% o primeiro vetor t1 considera o melhor sensor s
t1_b = s_b;
t1_i = s_i;

% o segundo vetor t2 e definido perpendicular aos vetores s e m
t2_b = cross(s_b,m_b)/norm(cross(s_b,m_b));
t2_i = cross(s_i,m_i)/norm(cross(s_i,m_i));

% o terceiro vetor e ortonormal aos anteriores (t1 e t2)
t3_b = cross(t1_b,t2_b)/norm(cross(t1_b,t2_b));
t3_i = cross(t1_i,t2_i)/norm(cross(t1_i,t2_i));

% matrizes de rota��o usando os vetores t
R_bt = [t1_b t2_b t3_b];
R_it = [t1_i t2_i t3_i];

% matriz de rotacao final
R_bi = R_bt*(R_it.');

for i=1:size(R_bi,1)
    for j=1:size(R_bi,2)
        if norm(R_bi(i,j)) < 1e-5
            R_bi(i,j) = 0;
        end
    end
end


end