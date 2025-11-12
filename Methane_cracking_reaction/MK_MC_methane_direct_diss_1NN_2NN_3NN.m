
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


%%%%%%%%%%%%%%%%%%%%%%%%%%MK model for H2O dissociation solely%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc
format long

%%%%%%%%%%%%%%%%Declaring the initial conditions of theta (normalised with respect to fcc sites)%%%%%%%%%%%%%%%%%%

N0 = zeros(9,1); 
N0(1) = 900;       %%%%%%%%%%%%Ntop%%%%%%%%%%%%%%%%%%
N0(2) = 1800;      %%%%%%%%%%%%Nfcc%%%%%%%%%%%%%%%%%%
N0(3) = 0;         %%%%%%%%%%%%NCH3%%%%%%%%%%%%%%%%%%
N0(4) = 0;         %%%%%%%%%%%%NCH2%%%%%%%%%%%%%%%%%%
N0(5) = 0;         %%%%%%%%%%%%NCH%%%%%%%%%%%%%%%%%%%
N0(6) = 0;         %%%%%%%%%%%%NC%%%%%%%%%%%%%%%%%%%%
N0(7) = 0;         %%%%%%%%%%%%NH2%%%%%%%%%%%%%%%%%%%
N0(8) = 0;         %%%%%%%%%%%%NH%%%%%%%%%%%%%%%%%%%%

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

cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\MC_production_runs\Finalized_Production_simulations\Completed_Verified_simulations\Results_compilation2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 800)
N_800K = N;
Nfccs_800K = Nfccs;
t_800K = t; 
save(strcat('MK_1NN_2NN_3NN_',num2str(Temperature_MSR),'K'),'N_800K','Nfccs_800K','t_800K');    
end    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 900)
N_900K = N;
Nfccs_900K = Nfccs;
t_900K = t;
save(strcat('MK_1NN_2NN_3NN_',num2str(Temperature_MSR),'K'),'N_900K','Nfccs_900K','t_900K');    
end    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 1000)
N_1000K = N;
Nfccs_1000K = Nfccs;
t_1000K = t;
save(strcat('MK_1NN_2NN_3NN_',num2str(Temperature_MSR),'K'),'N_1000K','Nfccs_1000K','t_1000K');   
end    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 1100)
N_1100K = N;
Nfccs_1100K = Nfccs;
t_1100K = t;
save(strcat('MK_1NN_2NN_3NN_',num2str(Temperature_MSR),'K'),'N_1100K','Nfccs_1100K','t_1100K');   
end   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 1200)
N_1200K = N;
Nfccs_1200K =  Nfccs;
t_1200K = t;
save(strcat('MK_1NN_2NN_3NN_',num2str(Temperature_MSR),'K'),'N_1200K','Nfccs_1200K','t_1200K');   
end   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(Temperature_MSR == 600)
N_600K_1NN_2NN_3NN = N;
Nfccs_600K_1NN_2NN_3NN = Nfccs;
t_600K_1NN_2NN_3NN = t;
cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\Methane_direct_diss_KMC\MK_scripts');
save(strcat('MK_1NN_2NN_3NN_',num2str(Temperature_MSR),'K'),'N_600K_1NN_2NN_3NN','Nfccs_600K_1NN_2NN_3NN','t_600K_1NN_2NN_3NN');   
end

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


%%%Changing the directory to save MKM_data%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dNdt = MKModel(t,N,Temperature_MSR)

global Temperature_MSR 

format long

currentdir = 'E:\Carbon_poisoning_models_final_calc\KMC_simulations\Methane_direct_diss_KMC\MK_scripts'; 

%%%%%%%%%%%%%%%%%%%%%%%%%Chainging directory to access MSR data%%%%%%%%%%%%%%%%%%%

cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\MC_data_generation\MC_Kinetic_const_direct_diss');

load(strcat('MC_data_',num2str(Temperature_MSR),'K'));    

cd(currentdir);

% %%%%%%%%%%Manipulating rate constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% K_CH3_CH2_H_fwd = K_CH3_CH2_H_fwd/10^(3); 
% K_CH3_CH2_H_rev = K_CH3_CH2_H_rev/10^(3);  
% K_CH2_CH_H_fwd = K_CH2_CH_H_fwd/10^(3); 
% K_CH2_CH_H_rev  = K_CH2_CH_H_rev/10^(3);
% K_H2_ads_rev = K_H2_ads_rev/10^(1);  
% K_H2_dis_fwd = K_H2_dis_fwd/10^(1);
% % K_H2_dis_rev = K_H2_dis_rev/10^(1); 
% 
Pressure_CH4_MSR = 0.0013332;

Pressure_H2_MSR = 0.00;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Including pressure%%%%%%%%%%%%%%%%%%%%%%%%%%

K_CH4_diss_fwd = K_CH4_diss_fwd*Pressure_CH4_MSR;

K_H2_ads_fwd = K_H2_ads_fwd*Pressure_H2_MSR;

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


%%%%%%%%%%%%%%%%%%%%Calling the function to compute the coverage dependent rate constants%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[K_CH2_CH_H_fwd_int, K_CH2_CH_H_rev_int, K_CH_C_H_fwd_int, K_CH_C_H_rev_int, ...
 K_CH4_diss_fwd_int, K_CH4_diss_rev_int, K_CH3_CH2_H_fwd_int, K_CH3_CH2_H_rev_int, K_H2_dis_fwd_int, K_H2_dis_rev_int] ...
 = MKM_1NN_2NN_3NN(NCH,NC,NCH2,NCH3,NH,NH2,Nfccs);


%%%%%%%%%%%%%%%%%%%%%%%%%CH4(g)+ top + 2fcc =  CH3* +  H* + top %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r1 = (GM_CH4_CH3_H_fwd*K_CH4_diss_fwd_int*Ntop*(Nfcc/Nfccs)*(Nfcc/Nfccs))...
     -(GM_CH4_CH3_H_rev*K_CH4_diss_rev_int*Ntop*(NCH3/Nfccs)*(NH/Nfccs));

 
%%%%%%%%%%%%%%%%%%%%%%%%% CH3* + top + fcc =  CH2*  +  H* + top %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r2 = (GM_CH3_CH2_H_fwd*K_CH3_CH2_H_fwd_int*NCH3*(Ntop/Nfccs)*(Nfcc/Nfccs))...
     -(GM_CH3_CH2_H_rev*K_CH3_CH2_H_rev_int*NCH2*(NH/Nfccs)*(Ntop/Nfccs)); 
 
%%%%%%%%%%%%%%%%%%%%%%%%CH2* + fcc =  CH*  +  H* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r3 = (GM_CH2_CH_H_fwd*K_CH2_CH_H_fwd_int*NCH2*(Nfcc/Nfccs))...
     -(GM_CH2_CH_H_rev*K_CH2_CH_H_rev_int*NCH*(NH/Nfccs));  
 
%%%%%%%%%%%%%%%%%%%%%%%%%CH* + top + fcc =  C* + top + +  H* + %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r4 = (GM_CH_C_H_fwd*K_CH_C_H_fwd_int*NCH*(Nfcc/Nfccs)*(Ntop/Nfccs))...
     -(GM_CH_C_H_rev*K_CH_C_H_rev_int*NC*(Ntop/Nfccs)*(NH/Nfccs));  
 
%%%%%%%%%%%%%%%%%%%%%%%%% H2(g) +  top  =  H2* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
r5 = (GM_H2_ads_fwd*K_H2_ads_fwd*Ntop) - ...
     (GM_H2_ads_rev*K_H2_ads_rev*NH2);
 
%%%%%%%%%%%%%%%%%%%%%%%%% H2* +  2fcc  =  2H* + top* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
r6 = (GM_H2_dis_fwd*K_H2_dis_fwd_int*NH2*(Nfcc/Nfccs)*(Nfcc/Nfccs)) - ...
     (GM_H2_dis_rev*K_H2_dis_rev_int*Ntop*(NH/Nfccs)*(NH/Nfccs)); 
  
 
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [K_CH2_CH_H_fwd_int, K_CH2_CH_H_rev_int, K_CH_C_H_fwd_int, K_CH_C_H_rev_int, ...
 K_CH4_diss_fwd_int, K_CH4_diss_rev_int, K_CH3_CH2_H_fwd_int, K_CH3_CH2_H_rev_int, K_H2_dis_fwd_int, K_H2_dis_rev_int] ...
 = MKM_1NN_2NN_3NN(NCH,NC,NCH2,NCH3,NH,NH2,Nfccs);

global Temperature_MSR

currentdir = 'E:\Carbon_poisoning_models_final_calc\KMC_simulations\Methane_direct_diss_KMC\MK_scripts'; 

%%%%%%%%%%%%%Chainging directory to access MSR data%%%%%%%%%%%%%%%%%%%

cd('E:\Carbon_poisoning_models_final_calc\KMC_simulations\MC_data_generation\MC_Kinetic_const_direct_diss');
% 
% load(strcat('MC_data_',num2str(Temperature_MSR),'K'),'Prexp_CH2_CH_H_fwd','Prexp_CH2_CH_H_rev',...
% 'Prexp_CH_C_H_fwd','Prexp_CH_C_H_rev','Energy_eV_to_J'); 
% load('MC_energetics','CNi_FE','CHNi_FE','HNi_FE','CH2Ni_FE','Eact_CH2_CH_H_fwd','Eact_CH2_CH_H_rev','Eact_CH_C_H_fwd',...
%      'Eact_CH_C_H_rev');

load(strcat('MC_data_',num2str(Temperature_MSR),'K')); 

load('Important_constants','Kb_MSR'); 

load('MC_energetics','CNi_FE','CHNi_FE','HNi_FE','CH2Ni_FE','Eact_CH2_CH_H_fwd','Eact_CH2_CH_H_rev','Eact_CH_C_H_fwd',...
     'Eact_CH_C_H_rev');
  
load('MC_IE_energies');


 
cd(currentdir);

%%%%%%%Elementary event %%%CH2* + fcc =  CH*  +  H* %%%%%%%%%%%%%%%%%%%%%%

E_CH_approx = CHNi_FE + ((3*CH_C_1NN_IE) +  (12*C_CH_2NN_IE) + (6*C_CH_3NN_IE)  + ... 
                         (3*CH_CH_1NN_IE)+  (6*CH_CH_2NN_IE) + (3*CH_CH_3NN_IE) + ...
                         (3*5.000000000) +  (12*CH_CH2_2NN_IE)+ (6*CH_CH2_3NN_IE) + ...
                         (3*5.000000000) +  (12*CH_CH3_2NN_IE)+ (6*CH_CH3_3NN_IE) + ...
                         (3*CH_H_1NN_IE) +  (12*CH_H_2NN_IE)  + (6*CH_H_3NN_IE))*(NCH/Nfccs) ;

E_C_approx =  CNi_FE + ((3*CH_C_1NN_IE) + (12*C_CH_2NN_IE)  + (6*C_CH_3NN_IE) + ...
                        (3*C_C_1NN_IE)  + (6*C_C_2NN_IE)    + (3*C_C_3NN_IE) + ...
                        (3*5.000000000) + (12*C_CH2_2NN_IE) + (6*C_CH2_3NN_IE) + ...
                        (3*5.000000000) + (12*C_CH3_2NN_IE) + (6*C_CH3_3NN_IE) + ...
                        (3*C_H_1NN_IE)  + (12*C_H_2NN_IE)   + (6*C_H_3NN_IE))*(NC/Nfccs);
                    
E_CH2_approx = CH2Ni_FE + ((3*5.000000000) + (12*C_CH2_2NN_IE)   + (6*C_CH2_3NN_IE) + ...
                           (3*5.000000000) + (12*CH_CH2_2NN_IE)   + (6*CH_CH2_3NN_IE) + ...
                           (3*5.000000000) + (6*CH2_CH2_2NN_IE) + (3*CH2_CH2_3NN_IE) + ...
                           (3*5.000000000) + (12*CH2_CH3_2NN_IE) + (6*CH2_CH3_3NN_IE) + ...
                           (3*5.000000000) + (12*H_CH2_2NN_IE)   + (6*H_CH2_3NN_IE))*(NCH2/Nfccs);
                                              
E_CH3_approx = CH3Ni_FE + ((3*5.000000000) + (12*CH_CH2_2NN_IE)  + (6*CH_CH2_3NN_IE) + ...
                           (3*5.000000000) + (12*CH_CH3_2NN_IE)   +(6*CH_CH3_3NN_IE) + ...
                           (3*5.000000000) + (12*CH2_CH3_2NN_IE) + (6*CH2_CH3_3NN_IE) + ...
                           (3*5.000000000) + (6*5.00000000000)  +  (3*5.000000000) + ...
                           (3*CH3_H_1NN_IE) + (12*H_CH3_2NN_IE)   + (6*H_CH3_3NN_IE))*(NCH3/Nfccs);                       
        
E_H_approx =   HNi_FE +   ((3*C_H_1NN_IE)   + (12*C_H_2NN_IE)     + (6*C_H_3NN_IE) + ...
                           (3*CH_H_1NN_IE)  + (12*CH_H_2NN_IE)   + (6*CH_H_3NN_IE) + ...
                           (3*CH3_H_1NN_IE) + (12*H_CH3_2NN_IE) + (6*H_CH3_3NN_IE) + ...
                           (3*5.000000000)  + (12*H_CH2_2NN_IE)  + (6*H_CH2_3NN_IE) + ...
                           (3*H_H_1NN_IE)   + (6*H_H_2NN_IE)   + (3*H_H_3NN_IE))*(NH/Nfccs);   
                                              
% E_H2_approx =  H2Ni_FE +   ((6*5.000000000) + (6*H2_C_2NN_IE)   + (6*C_H_3NN_IE) + ...
%                            (6*5.000000000)  + (6*H2_CH_2NN_IE)  + (6*CH_H_3NN_IE) + ...
%                            (6*5.000000000)  + (12*H2_CH2_2NN_IE) + (6*H_CH3_3NN_IE) + ...
%                            (6*5.000000000)  + (12*H2_CH3_2NN_IE) + (6*H_CH2_3NN_IE) + ...
%                            (6*5.000000000)  + (6*H_H_2NN_IE)    + (3*H_H_3NN_IE))*(NH2/Nfccs);                         
                    
                                                                                   
%%%%%%Step 2(1)%%%%%%%%%%%%%%Estimating the reaction energy at zero coverage and finite coverage %%%%%%%%%%%%

Delta_CH2_dis_finite_coverage = E_CH_approx + E_H_approx - E_CH2_approx; 

Delta_CH2_dis_zero_coverage  =  CHNi_FE + HNi_FE  - CH2Ni_FE; 

prox_fac_CH2_CH_H = 0.5;


%%%%%%Step 3(1)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Using BEP relations %%%%%%%%%%%to estimate coverage dependent activation barriers and rate constants%%%%%%%%%%%%

Eact_CH2_CH_H_fwd_int = max([0,Delta_CH2_dis_finite_coverage, Eact_CH2_CH_H_fwd + ...
                       prox_fac_CH2_CH_H*(Delta_CH2_dis_finite_coverage - Delta_CH2_dis_zero_coverage)]);


Eact_CH2_CH_H_rev_int = max([0,-Delta_CH2_dis_finite_coverage, Eact_CH2_CH_H_rev - ...
                       (1-prox_fac_CH2_CH_H)*(Delta_CH2_dis_finite_coverage - Delta_CH2_dis_zero_coverage)]);

                   
%%%%%%%Step 4(1)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K_CH2_CH_H_fwd_int = Prexp_CH2_CH_H_fwd * exp(-((Eact_CH2_CH_H_fwd_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR))); 

K_CH2_CH_H_rev_int = Prexp_CH2_CH_H_rev * exp(-((Eact_CH2_CH_H_rev_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)));


%%%%%%Step 2(2)%%%%%%%%%%%%%%%%%%%CH4(g)+ top + 2fcc =  CH3* +  H* + top %%%%%%%%%Estimating the reaction energy at zero coverage and finite coverage %%%%%%%%%%%%

Delta_CH4_dis_finite_coverage = E_CH3_approx + E_H_approx; 

Delta_CH4_dis_zero_coverage   = CH3Ni_FE  + HNi_FE; 

prox_fac_CH4_diss = 1.000;

%%%%%%Step 3(2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Using BEP relations %%%%%%%%%%%to estimate coverage dependent activation barriers and rate constants%%%%%%%%%%%%

Eact_CH4_CH3_H_fwd_int = max([0,Delta_CH4_dis_finite_coverage,Eact_CH4_CH3_H_fwd + ...
                       prox_fac_CH4_diss*(Delta_CH4_dis_finite_coverage - Delta_CH4_dis_zero_coverage)]);


Eact_CH4_CH3_H_rev_int = max([0,-Delta_CH4_dis_finite_coverage,Eact_CH4_CH3_H_rev - ...
                       (1-prox_fac_CH4_diss)*(Delta_CH4_dis_finite_coverage - Delta_CH4_dis_zero_coverage)]);

                   
%%%%%%%Step 4(2)%%%%%%%%%%%%%%%%%%%%%%OK%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   
K_CH4_diss_fwd_int = Prexp_CH4_diss_fwd * exp(-((Eact_CH4_CH3_H_fwd_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))

K_CH4_diss_rev_int = Prexp_CH4_diss_rev * exp(-((Eact_CH4_CH3_H_rev_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))


%%%%%%Step 2(3)%%%%%%%%%%%%%%%%%%%CH* + top + fcc =  C* + top + H* %%%%%%%%%%%Estimating the reaction energy at zero coverage and finite coverage %%%%%%%%%%%%

Delta_CH_dis_finite_coverage = E_C_approx + E_H_approx  - E_CH_approx; 

Delta_CH_dis_zero_coverage   = CNi_FE + HNi_FE  - CHNi_FE; 

prox_fac_CH_C_H = 0.5;


%%%%%%Step 3(3)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Using BEP relations %%%%%%%%%%%to estimate coverage dependent activation barriers and rate constants%%%%%%%%%%%%

Eact_CH_C_H_fwd_int = max([0,Delta_CH_dis_finite_coverage,Eact_CH_C_H_fwd + ...
                       prox_fac_CH_C_H*(Delta_CH_dis_finite_coverage - Delta_CH_dis_zero_coverage)]);


Eact_CH_C_H_rev_int = max([0,-Delta_CH_dis_finite_coverage,Eact_CH_C_H_rev - ...
                       (1-prox_fac_CH_C_H)*(Delta_CH_dis_finite_coverage - Delta_CH_dis_zero_coverage)]);

                   
%%%%%%%Step 4(3)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   
K_CH_C_H_fwd_int = Prexp_CH_C_H_fwd * exp(-((Eact_CH_C_H_fwd_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))

K_CH_C_H_rev_int = Prexp_CH_C_H_rev * exp(-((Eact_CH_C_H_rev_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))



%%%%%%Step 2(4)%%%%%%%%%%%%%%%%%%%Reaction: CH3* +  *  = CH2* +  H* %%%%%%%%%%%%%%%%Estimating the reaction energy at zero coverage and finite coverage %%%%%%%%%%%%

Delta_CH3_dis_finite_coverage = E_CH2_approx + E_H_approx - E_CH3_approx; 

Delta_CH3_dis_zero_coverage   = CH2Ni_FE  + HNi_FE  - CH3Ni_FE; 

prox_fac_CH3_CH2_H = 0.5;


%%%%%%Step 3(4)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Using BEP relations %%%%%%%%%%%to estimate coverage dependent activation barriers and rate constants%%%%%%%%%%%%

Eact_CH3_CH2_H_fwd_int = max([0,Delta_CH3_dis_finite_coverage, Eact_CH3_CH2_H_fwd + ...
                       prox_fac_CH3_CH2_H*(Delta_CH3_dis_finite_coverage - Delta_CH3_dis_zero_coverage)]);


Eact_CH3_CH2_H_rev_int = max([0,-Delta_CH3_dis_finite_coverage, Eact_CH3_CH2_H_rev - ...
                       (1-prox_fac_CH3_CH2_H)*(Delta_CH3_dis_finite_coverage - Delta_CH3_dis_zero_coverage)]);

                   
%%%%%%%Step 4(4)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   
K_CH3_CH2_H_fwd_int = Prexp_CH3_CH2_H_fwd*exp(-((Eact_CH3_CH2_H_fwd_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))

K_CH3_CH2_H_rev_int = Prexp_CH3_CH2_H_rev*exp(-((Eact_CH3_CH2_H_rev_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))


%%%%%%Step 2(5)%%%%%%%%%%%%%%%%%%%Reaction:% H2* +  2fcc  =  2H* + top* %%%%%%%%%%%Estimating the reaction energy at zero coverage and finite coverage %%%%%%%%%%%%

Delta_H2_dis_finite_coverage = 2*E_H_approx - H2Ni_FE; 

Delta_H2_dis_zero_coverage   = 2*HNi_FE  - H2Ni_FE; 

prox_fac_H2_diss = 0.5;


%%%%%%Step 3(5)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Using BEP relations %%%%%%%%%%%to estimate coverage dependent activation barriers and rate constants%%%%%%%%%%%%

Eact_H2_diss_fwd_int = max([0,Delta_H2_dis_finite_coverage, Eact_H2_diss_fwd + ...
                       prox_fac_H2_diss*(Delta_H2_dis_finite_coverage - Delta_H2_dis_zero_coverage)]);


Eact_H2_diss_rev_int = max([0,-Delta_H2_dis_finite_coverage, Eact_H2_diss_rev - ...
                       (1-prox_fac_H2_diss)*(Delta_H2_dis_finite_coverage - Delta_H2_dis_zero_coverage)]);

                   
%%%%%%%Step 4(5)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                   
K_H2_dis_fwd_int = Prexp_H2_dis_fwd  * exp(-((Eact_H2_diss_fwd_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))

K_H2_dis_rev_int = Prexp_H2_dis_rev * exp(-((Eact_H2_diss_rev_int*Energy_eV_to_J)/(Kb_MSR*Temperature_MSR)))


end






  

