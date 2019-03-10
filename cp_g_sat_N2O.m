function [out] = cp_g_sat_N2O (T)
% Isobaric specific heat capasity of gaseous N2O at the saturation
% line as a function of temperature.
% Temperature range is from 182.33 K to 300 K.
T0=1-T/309.57; 
out=6921.666184*T0.^(-2/3)-48400.467336*T0.^(-1/3)+132632-159467.43256*T0.^(1/3)+71109.453112*T0.^(2/3);
end