function [out] = rho_g_id (T,p,compound)
% Density of ideal gas at as a function of temperature and pressure. Need
% MolMass addon.
out = p./T./8314.5*MolMass(compound);
end