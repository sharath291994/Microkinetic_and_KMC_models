# -*- coding: utf-8 -*-
"""
Created on Tue Jul 30 12:58:14 2024

@author: dasha
"""

from numpy import linspace, zeros, exp, array
import matplotlib.pyplot as plt
import numpy as np
from scipy import integrate
from math import exp
from Rate_constants_873K import k1, k_1, k2, k_2, k3, k_3, k4, k_4, k5, k_5, k6, k_6, k7, k_7, k9, k_9, k10, k_10
from Rate_constants_873K import k11, k_11, k12, k_12, k13, k_13, k14, k_14, k15, k_15, k16, k_16, k17, k_17, k18, k_18, k20, k_20

def f(t, u):
    
    θ_CH3, θ_CH2, θ_CH, θ_C, θ_CO, θ_O, θ_OH, θ_H, θ_CHOH, θ_CHO, θ_COH, θ_H2O, θ_S = u
    
    p_CH4 = 3.33
    p_H2O = 6.67
    p_CO = 0
    p_H2 = 0
    p_CO2 = 0
        
    Rate_1 = (k1 * 6*p_CH4 * (θ_S**2)) - (k_1 * 6*θ_CH3 * θ_H)
    
    #rate_NH_rxn1 = (k1*()) - (k2*()) - 

    Rate_2 = (k2 * 6*θ_CH3 * θ_S ) - (k_2 * 6*θ_CH2 * θ_H)

    Rate_3 = (k3 * 6*θ_CH2 * θ_S) - (k_3 * 6*θ_CH * θ_H)

    Rate_4 = (k4 * 6*θ_CH * θ_S) - (k_4 * 6*θ_C * θ_H)

    Rate_5 = (k5 * 6*p_CO2 * θ_S) - (k_5 * 6*θ_CO * θ_O)

    Rate_6 = (k6 * p_H2O * θ_S) - (k_6 * θ_H2O)

    Rate_7 = (k7 * 6*θ_H2O * θ_S) - (k_7 * 6*θ_OH * θ_H)

    Rate_9 = (k9 * 6*θ_CH * θ_OH ) - (k_9 * 6*θ_CHOH * θ_S)

    Rate_10 = (k10 * 6*θ_CHOH * θ_S) - (k_10 * 6*θ_CHO * θ_H)

    Rate_11 = (k11 * 6*θ_CHOH* θ_S) - (k_11 * 6*θ_COH * θ_H)

    Rate_12 = (k12 * 6*θ_C * θ_O) - (k_12 * 6*θ_CO * θ_S)

    Rate_13 = (k13 * 6*θ_CH * θ_O) - (k_13 * 6*θ_CHO * θ_S)

    Rate_14 = (k14 * 6*θ_CHO * θ_S) - (k_14 * 6*θ_CO * θ_H)

    Rate_15 = (k15 * 6*θ_C * θ_OH) - (k_15 * 6*θ_COH * θ_S)

    Rate_16 = (k16 * 6*θ_COH * θ_S) - (k_16 * 6*θ_CO * θ_H)

    Rate_17 = (k17 * p_CO * θ_S) - (k_17 * θ_CO)

    Rate_18 = (k18 * 6*p_H2 * (θ_S**2)) - (k_18 * 6*(θ_H**2))

    Rate_20 = (k20 * 6*θ_OH * θ_S) - (k_20 * 6*θ_O * θ_H)
    
##############rnet = k PN2*(PH2)2##############################    

    u_CH3 = Rate_1 - Rate_2 ###dthetaNH = r1 - r2

    u_CH2 = Rate_2 - Rate_3 ###dthetaNH2* = r1 - r2

    u_CH = Rate_3 - Rate_4 - Rate_9 - Rate_13

    u_C = Rate_4 - Rate_12 - Rate_15

    u_CO = Rate_5 + Rate_12 + Rate_14 + Rate_16 + Rate_17 

    u_O = Rate_20 - Rate_12 - Rate_13 

    u_OH = Rate_7 - Rate_9 - Rate_20 - Rate_15

    u_H = Rate_1 + Rate_2 + Rate_3 + Rate_4 + Rate_7 + Rate_10 + Rate_11 + Rate_14 + Rate_16 + (2*Rate_18) + Rate_20

    u_CHOH = Rate_9 - Rate_10 - Rate_11

    u_CHO = Rate_10 + Rate_13 - Rate_14

    u_COH = Rate_11 + Rate_15 - Rate_16
            
    u_H2O = Rate_6 - Rate_7

    u_S = -(2* Rate_1) - Rate_2 - Rate_3 - Rate_4 - Rate_5 - Rate_6 - Rate_7 + Rate_9 - Rate_10 - Rate_11 + Rate_12 + Rate_13 - Rate_14 + Rate_15 - Rate_16 - Rate_17 - (2* Rate_18) - Rate_20 
    
    
    return [u_CH3, u_CH2, u_CH, u_C, u_CO, u_O, u_OH, u_H, u_CHOH, u_CHO, u_COH, u_H2O, u_S]

U_0 = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1)

sol = integrate.solve_ivp(f, (0, 1e-4), U_0, t_eval = np.linspace(0, 1e-4, 10000), method = 'Radau')

θ_CH3, θ_CH2, θ_CH, θ_C, θ_CO, θ_O, θ_OH, θ_H, θ_CHOH, θ_CHO, θ_COH, θ_H2O, θ_S = sol.y
t = sol.t

parameters = [θ_CH3, θ_CH2, θ_CH, θ_C, θ_CO, θ_O, θ_OH, θ_H, θ_CHOH, θ_CHO, θ_COH, θ_H2O, θ_S]
#summ = 0
#for i in range(len(parameters)):
 #   summ = summ + (parameters[i])[9900]
#print(summ)

##############################################################################################################################

sum1 = 0
sum2 = 0
sum3 = 0
for j in range(5000, 10000):
    sum1 = sum1 + θ_C[j]
    sum2 = sum2 + θ_CH[j]
   
print((sum1 / 5000), (sum2 / 5000))

def pull(array, d, f):
        
    pulled = []
    for i in range(d, f):
        a = array[i]
        pulled.append(a)
    return pulled

pulled_θ_C = pull(θ_C, 5000, 9999)
pulled_θ_CH = pull(θ_CH, 5000, 9999)
pulled_θ_S = pull(θ_S, 5000, 9999)
import statistics

st_dev1 = statistics.stdev(pulled_θ_C)
st_dev2 = statistics.stdev(pulled_θ_CH)
st_dev3 = statistics.stdev(pulled_θ_S)
#print(st_dev1, st_dev2, st_dev3)
p_CH4 = 3.33
Rate_1 = (k1 * p_CH4 * (θ_S**2)) - (k_1 * θ_CH3 * θ_H)
#plt.ylabel("Fraction coverage")
#plt.xlabel("Time (s)")
#plt.plot(t, (k1 * p_CH4 * (θ_S**2)) - (k_1 * θ_CH3 * θ_H), label = "θ_C", color = "black")
#plt.plot(t, θ_CH, label = "θ_CH", color = "lightseagreen")
#plt.plot(t, θ_S, label = "θ_S", color = "mediumvioletred")
#plt.title("Fraction coverage over time, 873K, 2:1 CH4 to H2O ratio")
#plt.legend()
#plt.show()

##################################################################################################################################
#This is the mkm model
def total(array1, array2):
    new_array = []
    for i in range(5):
        new_array.append(array1[i] + array2[i])
    return new_array

Temperature = [873, 973, 1073, 1173, 1273]

C_2_1 = [0.03307916469595089, 0.09084801135581508, 0.18949592273328145, 0.3077753284451902, 0.4355092488442739]
CH_2_1 = [0.9647183040369387, 0.9073473699789014, 0.8086191591941312, 0.6908194651895319, 0.5632961942825516]
S_2_1 = [0.0009865671654377762, 0.0007363906660687292, 0.0009034368144565425, 0.0005051699160842046, 0.00040892014506582346]    
total_coking_2_1 = total(C_2_1, CH_2_1)

C_2_1_error = [0.00037815484177879994, 0.0012971037866637153, 0.0018257708718516451, 0.003994829404752826, 0.004762095225961086]
CH_2_1_error = [0.00031977037503174924, 0.0012390909149030014, 0.0017753198611258562, 0.003939792081099364, 0.00471196830248148]
S_2_1_error = [3.6748548638906056e-05, 3.650032435984991e-05, 3.475740344908821e-05, 3.1649887534454135e-05, 2.7407683980578546e-05]

C_1_1 = [0.028434196096828738, 0.08472030991419684, 0.1690323479007813, 0.30926802110837665, 0.4407084754120214]
CH_1_1 = [0.96749630323788, 0.9127370362753959, 0.8276042202843844, 0.6891385510890379, 0.5579929944848802]
total_coking_1_1 = total(C_1_1, CH_1_1)

C_1_2 = [0.024554728378431884, 0.0746173808422513, 0.1489464703123763, 0.2999854780469309, 0.4391267004928243]
CH_1_2 = [0.9644449888386313, 0.9201772054533022, 0.8420808532811821, 0.6976834239628894, 0.5591796272942604]
total_coking_1_2 = total(C_1_2, CH_1_2)
print(total_coking_1_2)

C_1_3 = [0.022219681649776793, 0.06917608739048249, 0.13565651515473753, 0.2848510662993705, 0.4251604782625322]
CH_1_3 = [0.9404233716848658, 0.9193937556158921, 0.8263925961596762, 0.7108969174772571, 0.5720027210290164]
total_coking_1_3 = total(C_1_3, CH_1_3)

plt.plot(Temperature, C_1_3, label = "C", color = "black", marker = "o")
plt.plot(Temperature, C_1_2, color = "dimgray", marker = "o")
plt.plot(Temperature, C_1_1, color = "gray", marker = "o")
plt.plot(Temperature, C_2_1, color = "silver", marker = "o")

plt.plot(Temperature, CH_1_3, label = "CH", color = "darkcyan", marker = "o")
plt.plot(Temperature, CH_1_2, color = "lightseagreen", marker = "o")
plt.plot(Temperature, CH_1_1, color = "mediumturquoise", marker = "o")
plt.plot(Temperature, CH_2_1, color = "paleturquoise", marker = "o")

plt.plot(Temperature, total_coking_1_3, label = "C + CH", color = "brown", marker = "o")
plt.plot(Temperature, total_coking_1_2, color = "indianred", marker = "o")
plt.plot(Temperature, total_coking_1_1, color = "lightcoral", marker = "o")
plt.plot(Temperature, total_coking_2_1, color = "pink", marker = "o")
plt.xlabel("Temperature (K)")
plt.xticks(np.arange(873, 1373, step = 100))
plt.ylabel("Fraction coverage")
plt.title("Coverages, increasing H2O proportion as colour darkens, from 2:1 to 1:3 CH4 to H2O")
plt.legend()
plt.show()

##########################################################################################################################

"""Rate_1 = (k1(T) * p_CH4 * (θ_S**2)) - (k_1(T) * θ_CH3 * θ_H)


    Rate_2 = (k2(T) * θ_CH3 * θ_S ) - (k_2(T) * θ_CH2 * θ_H)
    
    k2(T)fwd = kBT/h * (QTSCH3diss/QISCH3*) * exp(-Efwd/kBT)  ##Harmnoic oscillator model formula for partition functions
    
    k2(T)rev = kBT/h * (QTSCH3diss/QFSCH2* QFSH*) * exp(-Erev/kBT) ##HHarmnoic oscillator model formula for partition functions

    Rate_3 = (k3(T) * θ_CH2 * θ_S) - (k_3(T) * θ_CH * θ_H)
    
    ##NNH* + H* = NHNH* + * 
    rateexmp = kfwd * ThethaNNH * ThethaH* - krev * ThethaNHNH * Thethavac  
    
    ##N2(g) + * = N2*###
    
    rateN2ads = kfwd*PN2(g)*Thethavac - krev * ThethaN2

    Rate_4 = (k4(T) * θ_CH * θ_S) - (k_4(T) * θ_C * θ_H)

    Rate_5 = (k5(T) * p_CO2 * θ_S) - (k_5(T) * θ_CO * θ_O)

    Rate_6 = (k6(T) * p_H2O * θ_S) - (k_6(T) * θ_H2O)

    Rate_7 = (k7(T) * θ_H2O * θ_S) - (k_7(T) * θ_OH * θ_H)

    Rate_9 = (k9(T) * θ_CH * θ_OH ) - (k_9(T) * θ_CHOH * θ_S)

    Rate_10 = (k10(T) * θ_CHOH * θ_S) - (k_10(T) * θ_CHO * θ_H)

    Rate_11 = (k11(T) * θ_CHOH* θ_S) - (k_11(T) * θ_COH * θ_H)

    Rate_12 = (k12(T) * θ_C * θ_O) - (k_12(T) * θ_CO * θ_S)

    Rate_13 = (k13(T) * θ_CH * θ_O) - (k_13(T) * θ_CHO * θ_S)

    Rate_14 = (k14(T) * θ_CHO * θ_S) - (k_14(T) * θ_CO * θ_H)

    Rate_15 = (k15(T) * θ_C * θ_OH) - (k_15(T) * θ_COH * θ_S)

    Rate_16 = (k16(T) * θ_COH * θ_S) - (k_16(T) * θ_CO * θ_H)

    Rate_17 = (k17(T) * p_CO * θ_S) - (k_17(T) * θ_CO)

    Rate_18 = (k18(T) * p_H2 * (θ_S**2)) - (k_18(T) * (θ_H**2))

Rate_20 = (k20(T) * θ_OH * θ_S) - (k_20(T) * θ_O * θ_H)"""




#################################################################
#1:2
tot_cok_1_2_mkm = [0.9889997172170631, 0.9947945862955535, 0.9910273235935584, 0.9976689020098203, 0.9983063277870847]
tot_cok_1_2_ni = [0.7278527509169723, 0.9102354118039346, 0.9340668222740913, 0.9396113371123708, 0.9438415471823942]
tot_cok_1_2_i = [0.2693509670766701, 0.2966527653565545, 0.3046781831019063, 0.3093669098611438, 0.3106609555189456]


plt.plot(Temperature, tot_cok_1_2_mkm, label = "MKM", color = "darkblue", marker = "o")
plt.plot(Temperature, tot_cok_1_2_ni, label = "KMC no interactions", color = "royalblue", marker = "o")
plt.plot(Temperature, tot_cok_1_2_i, label = "KMC with interactions", color = "orchid", marker = "o")
plt.xlabel("Temperature (K)")
plt.xticks(np.arange(873, 1373, step = 100))
plt.ylabel("Fraction coverage")
plt.title("C+CH coverages as a function of temperature, 1:2 CH4 to H2O ratio")
plt.legend(loc = "upper left")
plt.ylim(0, 1.5)
#plt.savefig('C:/Python Script/Sharath_VASP_scripts/Python codes/MSR_plots/C_CH_united.png', dpi=800)
plt.show()


TOF_CH4_1_2_i = [-13724.995387594476, -24541.422197988948, -42625.47000780279, -67947.8414755446, -110676.17413458743] 
TOF_CH4_1_2_ni = [-4577.592373909091, -7095.187630849344, -9783.303109333376, -12682.85451105057, -13952.306601905111]
TOF_CH4_1_2_mkm = [0, 0, 0, 0, 0]


plt.plot(Temperature, TOF_CH4_1_2_mkm, label = "MKM", color = "darkblue", marker = "o")
plt.plot(Temperature, TOF_CH4_1_2_ni, label = "KMC no interactions", color = "royalblue", marker = "o")
plt.plot(Temperature, TOF_CH4_1_2_i, label = "KMC with interactions", color = "orchid", marker = "o")
plt.xlabel("Temperature (K)")
plt.xticks(np.arange(873, 1373, step = 100))
plt.ylabel("TOF of CH4 (molecules per site per second)")
plt.title("TOF of CH4, 1:2 CH4 to H2O ratio")
plt.legend(loc = "lower left") 
#plt.savefig('C:/Python Script/Sharath_VASP_scripts/Python codes/MSR_plots/TOF_united.png', dpi=800)
plt.show()

