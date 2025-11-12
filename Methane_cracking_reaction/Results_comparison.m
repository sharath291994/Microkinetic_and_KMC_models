

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('MK_no_interaction_600K_downscaled','N_600K_no_interaction_downscaled','Nfccs_600K_no_interaction_downscaled','t_600K_no_int_downscaled');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('MK_no_interaction_600K','N_600K_no_interaction','Nfccs_600K_no_interaction','t_600K_no_int');


load('MC_model_600K_no_interactions','CH_spec_600K_no_interactions','C_spec_600K_no_interactions','t_600K_no_interactions',...);
     'Nall_600K_no_interactions','nCH4_gas_Spec_600K_no_interactions','NSites_600K_no_interactions','NSitesNorm_600K_no_interactions');

figure(1)
plot(t_600K_no_int,N_600K_no_interaction(:,5)/(Nfccs_600K_no_interaction/2));
hold on 
plot(t_600K_no_int_downscaled,N_600K_no_interaction_downscaled(:,5)/(Nfccs_600K_no_interaction_downscaled/2));
hold off 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('Time (s)','fontsize',16); 
ylabel('NCH/Ni','fontsize',16); 
set(gca,'fontsize',16);

legend('MK-downscaled','MK'); 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)

plot(t_600K_no_int,N_600K_no_interaction(:,6)/(Nfccs_600K_no_interaction/2));
hold on 
plot(t_600K_no_int_downscaled,N_600K_no_interaction_downscaled(:,6)/(Nfccs_600K_no_interaction_downscaled/2));
hold off 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('Time (s)','fontsize',16); 
ylabel('NC/Ni','fontsize',16); 
set(gca,'fontsize',16);

legend('MK-downscaled','MK'); 


load('MK_1NN_2NN_3NN_600K','N_600K_1NN_2NN_3NN','Nfccs_600K_1NN_2NN_3NN','t_600K_1NN_2NN_3NN');   

load('MK_1NN_2NN_3NN_600K_downscaled','N_600K_1NN_2NN_3NN_downscaled','Nfccs_600K_1NN_2NN_3NN_downscaled',...
     't_600K_1NN_2NN_3NN_downscaled');   


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure(3)

plot(t_600K_1NN_2NN_3NN,N_600K_1NN_2NN_3NN(:,5)/(Nfccs_600K_1NN_2NN_3NN/2));

hold on 

plot(t_600K_1NN_2NN_3NN_downscaled,N_600K_1NN_2NN_3NN_downscaled(:,5)/(Nfccs_600K_no_interaction_downscaled/2));

hold off 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xlabel('Time (s)','fontsize',16); 
ylabel('NCH/Ni','fontsize',16); 
set(gca,'fontsize',16);

legend('MK-downscaled','MK'); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
figure(4)

plot(t_600K_1NN_2NN_3NN,N_600K_1NN_2NN_3NN(:,6)/(Nfccs_600K_1NN_2NN_3NN/2));

hold on 

plot(t_600K_1NN_2NN_3NN_downscaled,N_600K_1NN_2NN_3NN_downscaled(:,6)/(Nfccs_600K_no_interaction_downscaled/2));

hold off 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xlabel('Time (s)','fontsize',16); 
ylabel('NC/Ni','fontsize',16); 
set(gca,'fontsize',16);

legend('MK-downscaled','MK'); 


% save('MC_model_600K_no_interactions','CH_spec_600K_no_interactions','C_spec_600K_no_interactions','t_600K_no_interactions',...);
%      'Nall_600K_no_interactions','nCH4_gas_Spec_600K_no_interactions','NSites_600K_no_interactions','NSitesNorm_600K_no_interactions');

figure(5)

plot(t_600K_no_interactions(1:6000),Nall_600K_no_interactions(1:6000,CH_spec_600K_no_interactions)/(Nfccs_600K_no_interaction_downscaled/2));

hold on 

plot(t_600K_no_int_downscaled,N_600K_no_interaction_downscaled(:,5)/(Nfccs_600K_no_interaction_downscaled/2));

plot(t_600K_no_int,N_600K_no_interaction(:,5)/(Nfccs_600K_no_interaction/2));

hold off 

legend('KMC','MK-downscaled','MK'); 



