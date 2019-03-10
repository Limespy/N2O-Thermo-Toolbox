% This code is very crude, inefficient and in many ways useless. Better
% results and faster execution can be archieved by deriving a proper
% analytical model and using MATLAB's own integral function.
% All numbers are in SI units.

clearvars
m0=1;             
T0=20+273;           % Starting temperature
p_out=1.01*10^5;

M=4.4013*10^-2;

%%
steps=1000;
delta_m=m0/steps;
delta_n=delta_m/M;
R=8.3145;
m=m0;
T = zeros(steps,1);    % Allocating space    
p = T;
V = T;
T(1) = T0;
p(1) = ThermoN2Osat('p',T0);
m_liquid=linspace(m0,0,steps);
for i = 2:steps
   hvap     = ThermoN2Osat('h_l',T(i-1))-ThermoN2Osat('h_g',T(i-1));
   delta_T  = delta_m/m_liquid(i-1)*hvap/ThermoN2Osat('cp_l',T(i-1));
   T(i)     = T(i-1)+delta_T;
   p(i)     = ThermoN2Osat('p',T(i));
   if p(i)  < p_out
      p(i)  = 0;
      T(i)  = 0;
      break
   end
   V(i)=V(i-1)+delta_n*R*T(i)/p_out;
end
T = T(p>0);          % Removing exess zeros"
V = V(p>0);
p = p(p>0);
m_liquid = m_liquid(p>0);

Work = p_out*V(end)

figure(1)
plot(m_liquid,V,'r')
grid on
title('Volume')
xlabel('Mass of liquid N2O')
ylabel('Volume of boiled N2O')

figure(2)
plot(m_liquid,T,'g')
grid on
title('Temperature')
xlabel('Mass of liquid N2O')
ylabel('Temperature of liquid N2O')

figure(3)
plot(m_liquid,p,'b')
grid on
title('Vapor pressure')
xlabel('Mass of liquid N2O')
ylabel('Vapor pressure of liquid N2O')