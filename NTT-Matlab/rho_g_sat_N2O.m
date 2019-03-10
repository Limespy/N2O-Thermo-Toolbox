function [out] = rho_g_sat_N2O (T)
% Density of gaseous N2O at saturation line as a function of temperature.
% Temperature range is from 182.33 K to 309.57 K.
T0=309.57./T-1; 
out=452*exp(-1.009*T0.^(1/3)-6.28792*T0.^(2/3)+7.50332*T0-7.90463*T0.^(4/3)+0.629427*T0.^(5/3));
end
