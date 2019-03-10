function [out] = Dh_vap_N2O(T)
% Specific enthalpy of vaporization of N2O as a function of temperature.
% Temperature range is from 182.33 K to 309.57 K.
T0=1-T/309.57;
out=324012*T0.^(1/3)+457524*T0.^(2/3)-360698*T0+104249*T0.^(4/3);
end