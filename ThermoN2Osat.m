function [out] = ThermoN2Osat ( type , T )
% Calculates some thermodynamical properties of N2O at the saturation
% line as a function of temperature.
% All properties are in SI units.
% 
% Supported properties, units, type syntax and max applicable temperature
% 
% PROPERTY                          UNIT     SYNTAX   maxT/K
% 
% Molar Mass                        kg/mol   'M'      
% CRITICAL POINT
% Temperature                       K        'T_c'    
% Pressure                          Pa       'p_c'    
% Density                           kg/m^3   'rho_c'  
% Molar volume                      m^3/mol  'Vmol_c' 
% SATURATION LINE
% Pressure                          Pa       'p'      309
% Density
%     Liquid                        kg/m^3   'rho_l'  309
%     Gas                           kg/m^3   'rho_g'  309
% Specific Enthalpy
%     Liquid                        J/(kg*K) 'h_l'    308
%     Gas                           J/(kg*K) 'h_g'    309
% Isobaric Specific Heat Capacity
%     Liquid                        J/(kg*K) 'cp_l'   303
%     Gas                           J/(kg*K) 'cp_g'   303  
% Dynamic Viscosity
%     Liquid                        kg/(s*m) 'mu_l'   303
%     Gas                           kg/(s*m) 'mu_g'   303
% 
% Source:
% ESDU International. 1991. Thermophysical properties of nitrous oxide.
% 
% Code written by Vili Vilenius in 2018
Tc     = 309.57;
pc     = 7.251*10^6;
rhoc   = 452;
M      = 44.013;
Vmol_c = 97*10^-6;
if strcmp(type,'M')
   out=M;
elseif strcmp(type,'T_c')
   out=Tc;
elseif strcmp(type,'p_c')
   out=pc;
elseif strcmp(type,'rho_c')
   out=rhoc;
elseif strcmp(type,'Vmol_c')
   out=Vmol_c;
else
   % Temperature dependent properties
   % Rehaping T-array to compatible format.
   sz=size(T);
   if sz(2)~=1 || length(sz)~=2
      T=reshape(T,[],1);
   end
   Tr=T/Tc; % Reduced temperature
   t1=1-Tr; % To shorten code
   if     strcmp(type,'p')
      V=[-6.71893 ; 1.35966 ; -1.3779 ; -4.051];
      out=pc*exp(((t1.^[1 , 3/2 , 5/2 , 5])*V)./Tr);
   elseif strcmp(type,'rho_l')
      i=[1.72328 ; -0.83950 ; 0.51060 ; -0.10412];
      out=rhoc*exp(t1.^((1:4)/3)*i);
   elseif strcmp(type,'rho_g')
      t2=t1./Tr;
      l=[-1.00900 ; -6.28792 ; 7.50332 ; -7.90463 ; 0.629427];
      out=rhoc*exp(t2.^(1/3:1/3:5/3)*l);
   elseif strcmp(type,'h_l')
      e=[-200 ; 116.043 ; -917.225 ; 794.779 ; -589.587];
      out=t1.^((0:4)/3)*e*10^3;
   elseif strcmp(type,'h_g')
      n=[-200 ; 440.055 ; -459.701 ; 434.081 ; -485.338];
      out=t1.^((0:4)/3)*n*10^3;
   elseif strcmp(type,'cp_l')
      i=[58.6286  ; 2499.73 ; -9502.37 ; 32732.7 ; -36291.1];
      out=t1.^(-1:3)*i;
   elseif strcmp(type,'cp_g')
      u=[6921.666184 ; -48400.467336 ; 132632 ; -159467.43256 ; 71109.453112];
      out=t1.^((-2:2)/3)*u;
   elseif strcmp(type,'mu_l')
      s=[1.6089 ; 2.0439 ; 5.24 ; -3.528725118065026];
      t3=(Tc-T)./(T-s(3));
      out=exp(s(4)+t3.^([1,4]/3)*s(1:2))*10^-3;
   elseif strcmp(type,'mu_g')
      V=[3.3281 ; -1.18237 ; -0.055155];
      t2=t1./Tr;
      out=exp(V(1)+t2.^([1/3,4/3])*V(2:3))*10^-6;
   else
      error('Property type not recognised. Use "help" to see proper syntax.') 
   end
   if sz(2)~=1
      out=reshape(out,sz);
   end
end
end