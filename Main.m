% Our aircraft design parameters 
N_rotor=6;         % number of rotors for vertical lift 
D_rotor=2.5;         % diameter of the rotors in m
rho= 1.225;        % Air density in Kg/m^3
FM=0.85;           % Figure of Merit( FM) is introduced to account for lose due ot profile drag
Vv= 5.83;           % vertical velocity in m/s during climb and descent  
prop_eff= 0.85;    % Propeller efficiency
cd0= 0.035;          % parasitic drag coefficient
CL= 1.5;           % wing lift coefficent 
AR=6;              % wing aspect ratio 
e=0.85;             % oswald efficiency
Vcr=69.4;         % Cruise speed in m/s
S =33.67;            % wing surface area in m^2 determined based on the wing loading 
SoCmin= 0.1;        % 10% batteryis the minimum battery capacity that must remain at the end of the mission for saftey reasons 
SED=600;            % Battery desnity Wh/kg
bat_eff= .85;       % Battery efficiency 
lf= 6;                % length of fuselage 
Pmax= 8;            % maximum fuselage section perimeter
Npax= 7;            % number of occupants
wing_load_factor= 3.5;             %wing gear design load factor 
Sth= 7.33;               %horizontal tail area
Stv= 4;                 % vertical tail area in m^2 
ARth = 2.1;           % horizontal Aspect ratio
ARtv =2;            % vertical tail area
trh=0.1;         %thickness to chord ratio Horizontal tail              
trv=0.1;         %thickness to chord ratio Vertical tail
sweep_tv= 0;        % quarter chord sweep of vertical tail 
lg_load_factor=  3.5;        %  landing gear design load factor             
llg=0.7;             % landing leg length 
PM=0.5;           %power margin 
mpayload= 740;    %payload mass in kg 



%bisection method of root finding 
xl=1000;     % lower limit of mass estimate 
xu= 5000;    % upper limit of mass estimate 
xr=0;
iter=0;
ea=100;
% xr=xr= (xu+xl)/2;
while (iter<1000 & ea>0.0001)
    xrold=xr;
    xr= (xu+xl)/2;
    iter=iter + 1;
    if (xr ~= 0 & iter ~= 0)
        ea= abs((xrold-xr)/xr)*100;
    end 
    temp=Weight_est(xl,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload);
    temp2=Weight_est(xr,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload);
    test =temp(1)*temp2(1) ;
    if test(1)<0 
         xu=xr;
    elseif test(1)>0 
         xl=xr;
    else    
        break 
    end 
end 
TGW=xr;
Powers= Weight_est(TGW,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload)/1000; 
Powers=Powers(2:end);
PL= TGW/Powers(1)
%% Testing our weighting model with known eVTOl examples 

% Wisk Cora  Range of 100km / change the weighting_est.m for cruise
% duration to 33.3
% N_rotor,D_rotor,Vv,AR,Vcr,SED,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload
N_rotor=12;         % number of rotors for vertical lift 
D_rotor=1.4; 
Vv= 5.83;
AR=5;          %% span=5
Vcr=180/3.6;
S =11.^2/5;
lf= 4.22;
Pmax=2*pi*1.4;
Npax= 2;
Sth= 7.33;               %horizontal tail area
Stv= 0;                 % vertical tail area in m^2 
ARth = 13;           % horizontal Aspect ratio
ARtv =0;            % vertical tail area
trh=0.1;         %thickness to chord ratio Horizontal tail              
trv=0.1;         %thickness to chord ratio Vertical tail
sweep_tv= 0;        % quarter chord sweep of vertical tail 
lg_load_factor=  3.5;        %  landing gear design load factor             
llg=0.7;  
mpayload= 180;
SED= 350;
xl=950;     % lower limit of mass estimate 
xu= 5000;    % upper limit of mass estimate 
xr=0;
iter=0;
ea=100;
% xr=xr= (xu+xl)/2;
while (iter<1000 & ea>0.001)
    xrold=xr;
    xr= (xu+xl)/2;
    iter=iter + 1;
    if (xr ~= 0 & iter ~= 0)
        ea= abs((xrold-xr)/xr)*100;
    end 
    temp=Weight_est(xl,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload);
    temp2=Weight_est(xr,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload);
    test =temp(1)*temp2(1) ;
    if test(1)<0 
         xu=xr;
    elseif test(1)>0 
         xl=xr;
    else    
        break 
    end 
end 
TGW=xr;
Powers= Weight_est(TGW,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload)/1000; 
