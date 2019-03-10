function [out] = rho_g_avg_N2O(T,p)
% A rough approximation of density of gaseous N2O as a function of
% temperature and pressure.
% Required functions rho_g_sat_N2O.m, rho_g_id and p_sat_N2O.m to
% operate.
p_red = p./p_sat_N2O(T); % Semi-reduced pressure
out = rho_g_sat_N2O(T).^p_red.*(p./T./188.91236680718).^(1-p_red);
end

