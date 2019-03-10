function [out] = cp_l_sat_N2O (T)
% Isobaric specific heat capasity of liquid N2O as a function of temperature.
% Temperature range is from 182.33 K to 300 K.
T0=1-T/309.57; 
out=58.6286./T0 + 2499.73-9502.37.*T0+32732.7.*T0.^2-36291.1.*T0.^3;
end