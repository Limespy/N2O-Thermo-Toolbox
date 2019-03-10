function [out] = p_sat_N2O(T)
% Saturation pressure of N2O as a function of temperature.
% Temperature range is from 182.33 K to 309.57 K.
T_red=T/309.57;
T0=1-T_red;
out=7.251e6*exp((-6.71893*T0+1.35966*T0.^(1.5)-1.3779*T0.^(2.5)-4.051*T0.^5)./T_red);
end