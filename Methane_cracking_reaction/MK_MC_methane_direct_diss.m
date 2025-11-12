
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%Developing a deterministic model for methane cracking reaction network%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%The following convention is being used in the matalb script
%%%%%%%%%%%%%%%for the MK model%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N1 = Ntop%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N2 = Nfcc%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N3 = NCH3%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N4 = NCH2%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N5 = NCH%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N6 = NC%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N7 = NH2%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%N8 = NH%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%MK model for H2O dissociation solely%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
format long


%%%%%%%%%%%%%%%%Declaring the initial conditions of theta (normalised with respect to fcc sites)%%%%%%%%%%%%%%%%%%
N0 = zeros(9,1); 
N0(1) = 900;       %%%%%%%%%%%%Ntop%%%%%%%%%%%%%%%%%
N0(2) = 1800;      %%%%%%%%%%%%Nfcc%%%%%%%%%%%%%%%%%%%%%
N0(3) = 0;         %%%%%%%%%%%%NCH3%%%%%%%%%%%%%%%%%%
N0(4) = 0;         %%%%%%%%%%%%NCH2%%%%%%%%%%%%%%%%%%%
N0(5) = 0;         %%%%%%%%%%%%NCH%%%%%%%%%%%%%%%%%%%
N0(6) = 0;         %%%%%%%%%%%%NC%%%%%%%%%%%%%%%%%%%
N0(7) = 0;         %%%%%%%%%%%%NH2%%%%%%%%%%%%%%%%%%%
N0(8) = 0;         %%%%%%%%%%%%NH%%%%%%%%%%%%%%%

global Temperature_MSR 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%including number of top sites %%%%%%
Ntops = 900; 
Nfccs = 1800; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tspan = 0:10^(-1):6*10;


for Temperature_MSR = 600:600

%%%%%%%%%%Calling the ODE15s solver%%%%%%%%%%%%%%%%%

[t,N] = ode15s(@(t,N)MKModel(t,N),tspan,N0);

cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\MC_production_runs\Production_runs_8_11_2021\Results_compilation');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 800)
N_800K_no_interaction = N;
Nfccs_800K_no_interaction = Nfccs;
t_800K_no_int = t; 
save(strcat('MK_no_interaction_',num2str(Temperature_MSR),'K'),'N_800K_no_interaction','Nfccs_800K_no_interaction','t_800K_no_int');    
end    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 900)
N_900K_no_interaction = N;
Nfccs_900K_no_interaction = Nfccs;
t_900K_no_int = t; 
save(strcat('MK_no_interaction_',num2str(Temperature_MSR),'K'),'N_900K_no_interaction','Nfccs_900K_no_interaction','t_900K_no_int');    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 1000)
N_1000K_no_interaction = N;
Nfccs_1000K_no_interaction = Nfccs;
t_1000K_no_int = t; 
save(strcat('MK_no_interaction_',num2str(Temperature_MSR),'K'),'N_1000K_no_interaction','Nfccs_1000K_no_interaction','t_1000K_no_int');   
end    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 1100)
N_1100K_no_interaction = N;
Nfccs_1100K_no_interaction = Nfccs;
t_1100K_no_int = t; 
save(strcat('MK_no_interaction_',num2str(Temperature_MSR),'K'),'N_1100K_no_interaction','Nfccs_1100K_no_interaction','t_1100K_no_int');   
end   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 1200)
N_1200K_no_interaction = N;
Nfccs_1200K_no_interaction = Nfccs;
t_1200K_no_int = t; 
save(strcat('MK_no_interaction_',num2str(Temperature_MSR),'K'),'N_1200K_no_interaction','Nfccs_1200K_no_interaction','t_1200K_no_int');   
end   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(Temperature_MSR == 600)
N_600K_no_interaction = N;
Nfccs_600K_no_interaction = Nfccs;
t_600K_no_int = t;
cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\Methane_direct_diss_KMC\MK_scripts');
save(strcat('MK_no_interaction_',num2str(Temperature_MSR),'K'),'N_600K_no_interaction','Nfccs_600K_no_interaction','t_600K_no_int');   
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
plot(t,N(:,1));
xlabel('Time (s)'); 
ylabel('Ntop'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
plot(t,N(:,2));
xlabel('Time (s)'); 
ylabel('Nfcc'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
plot(t,N(:,3)/Nfccs);
xlabel('Time (s)'); 
ylabel('NCH3/Nfccs'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
plot(t,N(:,4)/Nfccs);
xlabel('Time (s)'); 
ylabel('NCH2/Nfccs'); 

set(gca,'fontsize',16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%b%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(5)
plot(t,N(:,5)/Ntops);
xlabel('Time (s)','fontsize',16); 
ylabel('NCH/Ni','fontsize',16); 
set(gca,'fontsize',16);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6)
plot(t,N(:,6)/Ntops);
xlabel('Time (s)','fontsize',16); 
ylabel('NC/Ni','fontsize',16);
set(gca,'fontsize',16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(7)
plot(t,N(:,7)/Ntops);
xlabel('Time (s)'); 
ylabel('NH2/Ntops'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(8)
plot(t,N(:,8)/Nfccs);
xlabel('Time (s)'); 
ylabel('NH/fccs'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(9)
plot(t,N(:,1) + N(:,7));
xlabel('Time (s)'); 
ylabel('Top sites balance'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(10)
plot(t,N(:,2) + N(:,3) + N(:,4) + N(:,5) + N(:,6) +  N(:,8));
xlabel('Time (s)'); 
ylabel('Fcc site balance'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(11)
plot(t,N(:,9));
xlabel('Time (s)'); 
ylabel('CH4 gas moleclules consumption'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function dNdt = MKModel(t,N,Temperature_MSR)

global Temperature_MSR 

format long

currentdir = 'E:\Carbon_poisoning_models_final_calc\KMC_simulations\Methane_direct_diss_KMC\MK_scripts'; 

%%%%%%%%%%%%%%%%%%%%%%%%%Chainging directory to access MSR data%%%%%%%%%%%%%%%%%%%
cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\MC_data_generation\MC_Kinetic_const_direct_diss');

load(strcat('MC_data_',num2str(Temperature_MSR),'K'));    

cd(currentdir);

Pressure_CH4_MSR = 0.00133322;

Pressure_H2_MSR = 0.00;

% %%%%%%%%%%Manipulating rate constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% K_CH3_CH2_H_fwd = K_CH3_CH2_H_fwd/10^(3); 
% K_CH3_CH2_H_rev = K_CH3_CH2_H_rev/10^(3);  
% K_CH2_CH_H_fwd = K_CH2_CH_H_fwd/10^(3); 
% K_CH2_CH_H_rev  = K_CH2_CH_H_rev/10^(3);
% K_H2_ads_rev = K_H2_ads_rev/10^(1);  
% K_H2_dis_fwd = K_H2_dis_fwd/10^(1);
% % K_H2_dis_rev = K_H2_dis_rev/10^(1); 
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Including pressure%%%%%%%%%%%%%%%%%%%%%%%%%%

K_CH4_diss_fwd = K_CH4_diss_fwd*Pressure_CH4_MSR;

K_H2_ads_fwd = K_H2_ads_fwd*Pressure_H2_MSR;


%%%%%%%%%Manipulating the rate constant%%%%%%%%%%%%%%
% K_CH4_diss_fwd = K_CH4_diss_fwd/1000;


dNdt = zeros(8,1);

%%%%%%%%%%%%%%%%%%%%%%Normalisation constaant with respect to fcc sites%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nfccs = 1800; 

%%%%%%%%%%%%%%%%%%%%%%%%The geometry and symmetry factors%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%rxn1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GM_CH4_CH3_H_fwd = 3; 
SY_CH4_CH3_H_fwd = 2; 
GM_CH4_CH3_H_rev = 6; 
SY_CH4_CH3_H_rev = 1; 


%%%%%%%%%%%%%%%%%%%%%rxn2%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Check this again%
GM_CH3_CH2_H_fwd = 12; 
SY_CH3_CH2_H_fwd = 1; 
GM_CH3_CH2_H_rev = 12; 
SY_CH3_CH2_H_rev = 1; 


%%%%%%%%%%%%%%%%%%%%%rxn3%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Check this again%
GM_CH2_CH_H_fwd = 3; 
SY_CH2_CH_H_fwd = 1; 
GM_CH2_CH_H_rev = 3; 
SY_CH2_CH_H_rev = 1; 


%%%%%%%%%%%%%%%%%%%%%rxn4%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Check this again%
GM_CH_C_H_fwd = 6; 
SY_CH_C_H_fwd = 1; 
GM_CH_C_H_rev = 6; 
SY_CH_C_H_rev = 1; 


%%%%%%%%%%%%%%%%%%%%%rxn5%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Check this again%
GM_H2_ads_fwd = 1; 
SY_H2_ads_fwd = 1; 
GM_H2_ads_rev = 1; 
SY_H2_ads_rev = 1; 


%%%%%%%%%%%%%%%%%%%%%rxn6%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Check this again%
GM_H2_dis_fwd = 3; 
SY_H2_dis_fwd = 2; 
GM_H2_dis_rev = 3; 
SY_H2_dis_rev = 2; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Ntop = N(1); 
Nfcc = N(2); 
NCH3 = N(3);
NCH2 = N(4); 
NCH  = N(5); 
NC   = N(6); 
NH2  = N(7); 
NH   = N(8); 
NCH4_gas = N(9); 


%%%%%%%%%%%%%%%%%%%%%%%%%CH4(g)+ top + 2fcc =  CH3* +  H* + top %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r1 = (GM_CH4_CH3_H_fwd*K_CH4_diss_fwd*Ntop*(Nfcc/Nfccs)*(Nfcc/Nfccs))...
     -(GM_CH4_CH3_H_rev*K_CH4_diss_rev*Ntop*(NCH3/Nfccs)*(NH/Nfccs));

%%%%%%%%%%%%%%%%%%%%%%%%% CH3* + top + fcc =  CH2*  +  H* + top %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r2 = (GM_CH3_CH2_H_fwd*K_CH3_CH2_H_fwd*NCH3*(Ntop/Nfccs)*(Nfcc/Nfccs))...
     -(GM_CH3_CH2_H_rev*K_CH3_CH2_H_rev*NCH2*(NH/Nfccs)*(Ntop/Nfccs)); 
 
%%%%%%%%%%%%%%%%%%%%%%%%CH2* + fcc =  CH*  +  H* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r3 = (GM_CH2_CH_H_fwd*K_CH2_CH_H_fwd*NCH2*(Nfcc/Nfccs))...
     -(GM_CH2_CH_H_rev*K_CH2_CH_H_rev*NCH*(NH/Nfccs));  
 
%%%%%%%%%%%%%%%%%%%%%%%%%CH* + top + fcc =  C* + top + +  H* + %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r4 = (GM_CH_C_H_fwd*K_CH_C_H_fwd*NCH*(Nfcc/Nfccs)*(Ntop/Nfccs))...
     -(GM_CH_C_H_rev*K_CH_C_H_rev*NC*(Ntop/Nfccs)*(NH/Nfccs));  
 
%%%%%%%%%%%%%%%%%%%%%%%%% H2(g) +  top  =  H2* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
r5 = (GM_H2_ads_fwd*K_H2_ads_fwd*Ntop) - ...
     (GM_H2_ads_rev*K_H2_ads_rev*NH2);
 
%%%%%%%%%%%%%%%%%%%%%%%%% H2* +  2fcc  =  2H* + top* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
r6 = (GM_H2_dis_fwd*K_H2_dis_fwd*NH2*(Nfcc/Nfccs)*(Nfcc/Nfccs)) - ...
     (GM_H2_dis_rev*K_H2_dis_rev*Ntop*(NH/Nfccs)*(NH/Nfccs)); 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%set of ODEs%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

dNdt(1) =  -r5 + r6;                                      %%%%%%%%%%%%%%%rate of Ntop formation%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(2) =  -2*r1 - r2 - r3 - r4 - 2*r6;                   %%%%%%%%%%%%%%%rate of Nfcc formation%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(3) =  r1 - r2;                                       %%%%%%%%%%%%%%%rate of NCH3  formation%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(4) =  r2 - r3;                                       %%%%%%%%%%%%%%%rate of NCH2 formation%%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(5) =  r3 - r4;                                       %%%%%%%%%%%%%%%rate of NCH  formation%%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(6) =  r4;                                            %%%%%%%%%%%%%%%rate of NC  formation%%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(7) =  r5 - r6;                                       %%%%%%%%%%%%%%%rate of NH2 formation%%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(8) =  r1 + r2 + r3 + r4 + 2*r6;                      %%%%%%%%%%%%%%%rate of NH formation%%%%%%%%%%%%%%%%%%%%%%%%Done%%%
dNdt(9) =  -r1;                                           %%%%%%%%%%%%%%%rate of NCH4 gas molecules%%%%%%%%%%%%%%%%%%%%%%%Done%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end







  

