﻿* Encoding: UTF-8.
* Encoding: UTF-8

/*
GET DATA 
  /TYPE=XLSX 
  /FILE='D:\Vijay Kasotia\SPSS\Quantitative Portfolio\CW2_7PS509_Raw_Data_Sets_First_Sit_Health_2022_23.xlsx' 
  /SHEET=name 'BASS' 
  /CELLRANGE=FULL 
  /READNAMES=ON 
  /DATATYPEMIN PERCENTAGE=95.0 
  /HIDDEN IGNORE=YES. 
EXECUTE.
*/

UNIANOVA BASS BY InterventionGroup BMI 
  /METHOD=SSTYPE(3) 
  /INTERCEPT=INCLUDE 
  /POSTHOC=InterventionGroup(TUKEY BONFERRONI) 
  /PLOT=PROFILE(InterventionGroup*BMI) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO 
  /PRINT DESCRIPTIVE 
  /CRITERIA=ALPHA(.05) 
  /DESIGN=InterventionGroup BMI InterventionGroup*BMI.

/*
GET DATA 
  /TYPE=XLSX 
  /FILE='D:\Vijay Kasotia\SPSS\Quantitative Portfolio\CW2_7PS509_Raw_Data_Sets_First_Sit_Health_2022_23.xlsx' 
  /SHEET=name 'CHD Symptoms' 
  /CELLRANGE=FULL 
  /READNAMES=ON 
  /DATATYPEMIN PERCENTAGE=95.0 
  /HIDDEN IGNORE=YES. 
EXECUTE.
*/


LOGISTIC REGRESSION VARIABLES CHDsymptoms 
  /METHOD=ENTER Occlusion Age 
  /CLASSPLOT 
  /PRINT=GOODFIT 
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).


