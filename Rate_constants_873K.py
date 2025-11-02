# -*- coding: utf-8 -*-
"""
Created on Tue Aug  6 14:56:22 2024

@author: dasha
"""

#25. CO2_dissociation_fwd:    A(Tini) =  0.0000E+00    Ea       =  0.36    k(Tini) =  0.0000E+00    Reaction: CO2  +  *(.)  +  *(.)  ->  CO*(.)  +  O*(.)
 #      26. CO2_dissociation_rev:    A(Tini) =  4.3580E+13  [ Ea-ideal =  1.62    k(Tini) =  2.0158E+04 ]  Reaction: CO*(.)  +  O*(.)  ->  CO2  +  *(.)  +  *(.)
     #  27. CO_formation_fwd:        A(Tini) =  1.1930E+14    Ea       =  1.94    k(Tini) =  7.4366E+02    Reaction: C*(.)  +  O*(.)  ->  CO*(.)  +  *(.)
      # 28. CO_formation_rev:        A(Tini) =  1.1098E+13  [ Ea-ideal =  3.27    k(Tini) =  1.4911E-06 ]  Reaction: CO*(.)  +  *(.)  ->  C*(.)  +  O*(.)
       #29. CHOH_formation_fwd:      A(Tini) =  1.8950E+13    Ea       =  1.16    k(Tini) =  3.6134E+06    Reaction: CH*(.)  +  OH*(.)  ->  CHOH*(.)  +  *(.)
      # 30. CHOH_formation_rev:      A(Tini) =  9.3905E+12  [ Ea-ideal =  0.51    k(Tini) =  1.0398E+10 ]  Reaction: CHOH*(.)  +  *(.)  ->  CH*(.)  +  OH*(.)
       #31. CHOH_diss_CHO_H_fwd:     A(Tini) =  3.7110E+14    Ea       =  0.75    k(Tini) =  1.8318E+10    Reaction: CHOH*(.)  +  *(.)  ->  CHO*(.)  +  H*(.)
       #32. CHOH_diss_CHO_H_rev:     A(Tini) =  2.0158E+14  [ Ea-ideal =  1.18    k(Tini) =  3.3208E+07 ]  Reaction: CHO*(.)  +  H*(.)  ->  CHOH*(.)  +  *(.)
       #33. CHOH_diss_COH_H_fwd:     A(Tini) =  4.0640E+13    Ea       =  0.12    k(Tini) =  8.4673E+12    Reaction: CHOH*(.)  +  *(.)  ->  COH*(.)  +  H*(.)
       #34. CHOH_diss_COH_H_rev:     A(Tini) =  5.2724E+12  [ Ea-ideal =  0.82    k(Tini) =  9.9943E+07 ]  Reaction: COH*(.)  +  H*(.)  ->  CHOH*(.)  +  *(.)
      # 35. CHO_formation_fwd:       A(Tini) =  2.2710E+13    Ea       =  1.24    k(Tini) =  1.5979E+06    Reaction: CH*(.)  +  O*(.)  ->  CHO*(.)  +  *(.)
       #36. CHO_formation_rev:       A(Tini) =  5.9419E+12  [ Ea-ideal =  0.79    k(Tini) =  1.7007E+08 ]  Reaction: CHO*(.)  +  *(.)  ->  CH*(.)  +  O*(.)
       #37. CHO_dissociation_fwd:    A(Tini) =  2.4700E+13    Ea       =  0.19    k(Tini) =  1.9244E+12    Reaction: CHO*(.)  +  *(.)  ->  CO*(.)  +  H*(.)
       #38. CHO_dissociation_rev:    A(Tini) =  4.7128E+12  [ Ea-ideal =  1.51    k(Tini) =  9.0396E+03 ]  Reaction: CO*(.)  +  H*(.)  ->  CHO*(.)  +  *(.)
      # 39. COH_formation_fwd:       A(Tini) =  3.7000E+13    Ea       =  1.09    k(Tini) =  1.8618E+07    Reaction: C*(.)  +  OH*(.)  ->  COH*(.)  +  *(.)
       #40. COH_formation_rev:       A(Tini) =  4.4333E+12  [ Ea-ideal =  1.60    k(Tini) =  2.5366E+03 ]  Reaction: COH*(.)  +  *(.)  ->  C*(.)  +  OH*(.)
     #  41. COH_dissociation_fwd:    A(Tini) =  4.9460E+13    Ea       =  0.93    k(Tini) =  2.2609E+08    Reaction: COH*(.)  +  *(.)  ->  CO*(.)  +  H*(.)
      # 42. COH_dissociation_rev:    A(Tini) =  3.9505E+13  [ Ea-ideal =  1.97    k(Tini) =  1.6309E+02 ]  Reaction: CO*(.)  +  H*(.)  ->  COH*(.)  +  *(.)
      # 43. CO_adsorption_fwd:       A(Tini) =  0.0000E+00    Ea       =  0.00    k(Tini) =  0.0000E+00    Reaction: CO  +  *(.)  ->  CO*(.)
       #44. CO_adsorption_rev:       A(Tini) =  3.9748E+16  [ Ea-ideal =  2.12    k(Tini) =  2.2945E+04 ]  Reaction: CO*(.)  ->  CO  +  *(.)
      # 45. H2O_adsorption_fwd:      A(Tini) =  1.7535E+09    Ea       =  0.00    k(Tini) =  1.7535E+09    Reaction: H2O  +  *(.)  ->  H2O*(.)
      # 46. H2O_adsorption_rev:      A(Tini) =  1.1737E+15  [ Ea-ideal =  0.54    k(Tini) =  9.3216E+11 ]  Reaction: H2O*(.)  ->  H2O  +  *(.)
      # 47. H2O_dissociation_fwd:    A(Tini) =  1.3530E+13    Ea       =  0.89    k(Tini) =  9.7188E+07    Reaction: H2O*(.)  +  *(.)  ->  OH*(.)  +  H*(.)
       #48. H2O_dissociation_rev:    A(Tini) =  2.3307E+14  [ Ea-ideal =  1.32    k(Tini) =  5.3691E+06 ]  Reaction: OH*(.)  +  H*(.)  ->  H2O*(.)  +  *(.)
     #  49. OH_dissociation_fwd:     A(Tini) =  1.2360E+14    Ea       =  0.98    k(Tini) =  2.7198E+08    Reaction: OH*(.)  +  *(.)  ->  O*(.)  +  H*(.)
      # 50. OH_dissociation_rev:     A(Tini) =  1.2713E+14  [ Ea-ideal =  1.21    k(Tini) =  1.3329E+07 ]  Reaction: O*(.)  +  H*(.)  ->  OH*(.)  +  *(.)
       #51. H2_dissociation_fwd:     A(Tini) =  0.0000E+00    Ea       =  0.00    k(Tini) =  0.0000E+00    Reaction: H2  +  *(.)  +  *(.)  ->  H*(.)  +  H*(.)
       #52. H2_dissociation_rev:     A(Tini) =  7.2027E+15  [ Ea-ideal =  1.33    k(Tini) =  1.4721E+08 ]  Reaction: H*(.)  +  H*(.)  ->  H2  +  *(.)  +  *(.)
      # 53. CH_dissociation_fwd:     A(Tini) =  2.2270E+14    Ea       =  1.31    k(Tini) =  6.4308E+06    Reaction: CH*(.)  +  *(.)  ->  C*(.)  +  H*(.)
       #54. CH_dissociation_rev:     A(Tini) =  1.1947E+14  [ Ea-ideal =  0.84    k(Tini) =  1.6029E+09 ]  Reaction: C*(.)  +  H*(.)  ->  CH*(.)  +  *(.)
      # 55. CH2_dissociation_fwd:    A(Tini) =  3.5380E+13    Ea       =  0.27    k(Tini) =  1.0446E+12    Reaction: CH2*(.)  +  *(.)  ->  CH*(.)  +  H*(.)
       #56. CH2_dissociation_rev:    A(Tini) =  4.2468E+13  [ Ea-ideal =  0.63    k(Tini) =  9.2901E+09 ]  Reaction: CH*(.)  +  H*(.)  ->  CH2*(.)  +  *(.)
      # 57. CH3_dissociation_fwd:    A(Tini) =  1.2570E+14    Ea       =  0.66    k(Tini) =  1.8455E+10    Reaction: CH3*(.)  +  *(.)  ->  CH2*(.)  +  H*(.)
       #58. CH3_dissociation_rev:    A(Tini) =  4.6128E+13  [ Ea-ideal =  0.64    k(Tini) =  9.6964E+09 ]  Reaction: CH2*(.)  +  H*(.)  ->  CH3*(.)  +  *(.)
     #  59. CH4_dissociation_fwd:    A(Tini) =  2.9565E+08    Ea       =  0.41    k(Tini) =  1.2534E+06    Reaction: CH4  +  *(.)  +  *(.)  ->  CH3*(.)  +  H*(.)
      # 60. CH4_dissociation_rev:    A(Tini) =  2.9272E+14  [ Ea-ideal =  0.94    k(Tini) =  1.0534E+09 ]  Reaction: CH3*(.)  +  H*(.)  ->  CH4  +  *(.)  +  *(.)


k1 = 1.2534E+06
k_1 = 1.0534E+09
k2 = 1.8455E+10 
k_2 = 9.6964E+09
k3 = 1.0446E+12
k_3 = 9.2901E+09
k4 = 6.4308E+06
k_4 = 1.6029E+09
k5 = 0.0000E+00
k_5 = 2.0158E+04
k6 = 1.7535E+09
k_6 = 9.3216E+11
k7 = 9.7188E+07
k_7 = 5.3691E+06
k9 = 3.6134E+06
k_9 = 1.0398E+10
k10 = 1.8318E+10
k_10 = 3.3208E+07
k11 = 8.4673E+12
k_11 = 9.9943E+07
k12 = 7.4366E+02
k_12 = 1.4911E-06
k13 = 1.5979E+06
k_13 = 1.7007E+08
k14 = 1.9244E+12
k_14 = 9.0396E+03
k15 = 1.8618E+07
k_15 = 2.5366E+03
k16 = 2.2609E+08
k_16 = 1.6309E+02
k17 = 0.0000E+00
k_17 = 2.2945E+04
k18 = 0.0000E+00
k_18 = 1.4721E+08
k20 = 2.7198E+08
k_20 = 1.3329E+07