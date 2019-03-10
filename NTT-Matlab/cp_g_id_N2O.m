function [out] = cp_g_id_N2O (T)
% Isobaric specific heat capasity of gaseous N2O at low pressures as a
% function of temperature.
% Temperature range is from 182.33 K to 1000 K.
T_red = T/309.57; % Reduced temperature
out=99.053*T_red.^(-0.5)-169.903+1208.22*T_red.^(0.5)-248.324*T_red;
end