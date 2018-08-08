function [roll, pitch, yaw] = recuperaAngulos132(M)
    %recupera os agulos de euler para uma matriz de rotacao 132
    pitch_ = atan(M(3,1)/M(1,1));
    pitch = rad2deg(pitch_);
    yaw_ = atan2(-M(2,1),M(1,1)/cos(pitch_));
    yaw = rad2deg(yaw_);
    roll_ = atan2(M(2,3)/cos(yaw_),M(2,2)/cos(yaw_));
    roll = rad2deg(roll_);
end