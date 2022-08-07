*variable to denote baseline covariates

recode ragender (1=0) (2=1), gen(Female_wave1)
recode r1agey (20/39=30) (40/49=40), gen(Age_wave1)
recode h1cpl (0=0) (1=1), gen(Marriedstatus_wave1)
recode raracem (1=0) (4=1) (-18/-1=.), gen(Ethnicminority)
recode raeducl (1=0) (2=1) (3=2) (-15=3) (-18=.) (-13/-1=.), gen(Educationlevel_wave1)
recode r1mstath (1=0) (4/5=1) (6=2) (7=3), gen(MaritalStatus_wave1)
recode rabplace (1=0) (11=1) (-18/-1=.), gen(BornAbroad_wave1)
recode r1shlt (-18/-1=.), gen(HealthStatus_wave1)
recode r1drink (-18/-1=.), gen(Drinker_wave1)


*creates quintiles of income distribution
recode h1itot (-20/-1=.), gen(Income_wave1)
xtile Incomewave1_quinttile=Income_wave1, nq(5)

*gen smoking status whether current or ex-smoker at wave 1

recode r1smoken (-18/-1=.), gen(Smokerstatus_wave1)
recode Smokerstatus_wave1 (0=1) if r1smokev==1

*creats a physical activity levels variables at wave 1 (baseline)
recode r1vgactx_e (5=0) (2/4=3), gen(PhysActivity_wave1)
recode PhysActivity_wave1 (0=2) if r1mdactx_e>1 & r1mdactx_e<5
recode PhysActivity_wave1 (0=1) if r1ltactx_e>1 & r1mdactx_e<5

* this command defines the year when participants died
gen Deathyear=radyear


*this just labels the variables for government region

gen str Region="London" if gor=="H"
replace Region="South West" if gor=="K"
replace Region="South East" if gor=="J"
replace Region="East of England" if gor=="G"
replace Region="East Midlands" if gor=="E"
replace Region="West Midlands" if gor=="F"
replace Region="North West" if gor=="B"
replace Region="North East" if gor=="A"
replace Region="Yorkshire and Humberside" if gor=="D"


* this command creates a continuous depression measure at each time point
gen Depression_wave1=r1cesd
gen Depression_wave2=r2cesd
gen Depression_wave3=r3cesd
gen Depression_wave4=r4cesd
gen Depression_wave5=r5cesd
gen Depression_wave6=r6cesd
gen Depression_wave7=r7cesd
gen Depression_wave8=r8cesd
gen Depression_wave9=r9cesd

* this command creates a binary depression measure at each time point
recode r1depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave1)
recode r2depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave2)
recode r3depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave3)
recode r4depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave4)
recode r5depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave5)
recode r6depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave6)
recode r7depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave7)
recode r8depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave8)
recode r9depres (-18/-1=.) (0=0) (1=1), gen(Depressionbinary_wave9)