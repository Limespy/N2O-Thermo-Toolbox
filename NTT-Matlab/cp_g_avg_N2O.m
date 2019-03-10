function [out] = cp_g_avg_N2O(T,p)
% A rough approximation of isobaric specific heat capacity of gaseous N2O as
% a function of temperature and pressure.
% Required functions cp_g_sat_N2O.m, cp_g_id_N2O.m and p_sat_N2O.m to
% operate.
p_red = p./p_sat_N2O(T); % Semi-reduced pressure
out = cp_g_sat_N2O(T).^p_red.*cp_g_id_N2O(T).^(1-p_red);
end

