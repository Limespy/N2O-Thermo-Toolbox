function [out] = rho_l_sat_N2O (T)
% Density of liquid N2O at saturation line as a function of temperature.
% Temperature range is from 182.33 K to 309.57 K.
T0=1-T/309.57;
out=452*exp(1.72328*T0.^(1/3)-0.83950*T0.^(2/3)+0.51060*T0-0.10412*T0.^(4/3));
end