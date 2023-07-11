function [out]= Weight_est(m,N_rotor,SED,D_rotor,Vv,AR,Vcr,S,lf,Pmax,Npax,Sth,Stv,ARth,ARtv,trh,trv,sweep_tv,lg_load_factor,llg,mpayload)
% This Function is used for the weight estimation of our eVTOL design based
% on the method described by Osita Ugwueze et al[An Efficient and Robust Sizing Method for eVTOL Aircraft
% Configurations in Conceptual Design]
    rho= 1.225;        % Air density in Kg/m^3
    FM=0.85;           % Figure of Merit( FM) is introduced to account for lose due ot profile drag
    prop_eff= 0.85;    % Propeller efficiency
    cd0= 0.05;          % parasitic drag coefficient
    CL= 1.5;           % wing lift coefficent 
    e=0.85;             % oswald efficiency
    SoCmin= 0.1;        % 10% batteryis the minimum battery capacity that must remain at the end of the mission for saftey reasons 
    bat_eff= .9;        % Battery efficiency 
    wing_load_factor= 3.5;             %wing gear design load factor 
    PM=0.5;                            %power margin for saftey
    A= N_rotor*pi()*D_rotor.^2/4;
    cD=cd0 + CL.^2/(pi()*AR*e);   % drag coefficent 
    D=0.5*rho*Vcr.^2*S*cD;         %induced drag 
    LD=CL/cD;
    Vhv = @(m) sqrt(10*m/(2*rho*A));   % 
    Phv = @(m) (m*10)^1.5/(FM*sqrt(2*rho*A));
    % Vv/Vhv(m)    %check the ratio 
    Pcb = @(m) (Vv/(2*Vhv(m)) + sqrt((Vv/(2*Vhv(m))).^2+1))*Phv(m);      % valid for Vv/Vhv>=0
    Vv=-Vv;  % for descent 
    if Vv/Vhv(m) <= -2
        Pds = @(m) (Vv/(2*Vhv(m)) + sqrt((Vv/(2*Vhv(m))).^2-1))*Phv(m);      % valid for Vv/Vhv<=-2
    else 
        Pds=@(m) Phv(m);
    end
    Lf= CL*rho*0.5*Vcr.^2*S;                          % lift force from the wing  
    Pcr = 1/prop_eff*D*Vcr;       % cruise power 
    thv=0.17*60;tcb=120;tcr=14.4*60 ;tds=120;thv2=0.17*60;    % mission segment duration in seconds
    E =@ (m) 2*(Phv(m)*thv+Pcb(m)*tcb+Pcr*tcr+Pds(m)*tds+Phv(m)*thv2);
    mb= @ (m) E(m)*(1+SoCmin)/(SED*3600*bat_eff);
    mf= @ (m) 14.86*m^0.144*lf^0.776/(Pmax)*lf^0.383*Npax^0.455;
    mw= @ (m) 0.04674*m.^0.397*S^0.36*wing_load_factor^0.397*AR^1.712;
    mt_h = @ (m) 3.184*m^0.887*Sth.^0.101*ARth.^0.101/(174.04*trh.^0.223);
    mt_v=  @ (m) 1.68*m^0.567*Stv.^1.249*ARtv.^0.482/(639.95*trv.^0.747*((cos(sweep_tv)).^0.882));
    mlg= @ (m) 0.054*llg^0.054*(m*lg_load_factor)^0.684;
    mmot= @(m) 0.165*(Pcb(m)/1000*(1+PM)/(N_rotor));    
    mprop= @(m) 0.144*(D_rotor*Pcb(m)/(1000*N_rotor)*(3)^0.5)^0.782;
    % mboom=;
    % mpusher=;
    mass_b=mb(m);
    mass_f=mf(m);
    mass_w=mw(m);
    mass_th=mt_h(m);
    mass_tv=mt_v(m);
    mass_lg=mlg(m);
    mass_mot=mmot(m)*N_rotor;
    mass_prop=mprop(m);

    f= m-(mass_b + mass_f+ mass_w +mass_th + mt_v(m) + mass_lg+ mass_mot+mass_prop +mpayload +mass_tv);
    out= [f,Phv(m),Pcb(m), Pcr, Pds(m),LD] ;
   a= mb(m) + mf(m)+ mw(m) +mt_h(m) + mt_v(m) + mlg(m)+ mmot(m)+ mprop(m) + mpayload;
   b=mass_b + mass_f + mass_w + mass_th + mass_lg + mass_mot + mass_prop + mpayload;
end 



