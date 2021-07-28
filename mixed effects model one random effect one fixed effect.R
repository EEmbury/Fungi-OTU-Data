#Code from Dr.Romero Olivares

#mixed model ANOVA 
#one random effect = year 
#one fixed effect = treatment 

if(!require(psych)){install.packages("psych")}
if(!require(lme4)){install.packages("lme4")}
if(!require(lmerTest)){install.packages("lmerTest")}
if(!require(multcompView)){install.packages("multcompView")}
if(!require(lsmeans)){install.packages("lsmeans")}
if(!require(nlme)){install.packages("nlme")}
if(!require(car)){install.packages("car")}
if(!require(rcompanion)){install.packages("rcompanion")}

Input = ("
Alpha	Year	Grouped
3.32327791	_2012	Control
4.098378072	_2012	Control
3.206203076	_2012	Control
3.863245163	_2012	Control
3.85208755	_2012	Control
3.937531976	_2012	Control
2.382194312	_2012	Control
3.053506006	_2012	Control
3.802747627	_2012	Control
3.272615283	_2012	Control
3.627982746	_2012	Control
3.422469759	_2012	Control
2.201019971	_2012	Control
2.125223904	_2012	Control
3.010696809	_2012	Control
2.484257017	_2012	Control
2.607859475	_2012	Control
2.27238092	_2012	Control
2.512774969	_2012	Control
2.784918514	_2012	Heated
2.929848735	_2012	Nitrogen
3.101739163	_2012	Nitrogen
3.737241555	_2012	Nitrogen
3.981765497	_2012	Nitrogen
4.624177802	_2012	Nitrogen
4.532411249	_2012	Nitrogen
2.935816774	_2012	Nitrogen
3.033652307	_2012	Nitrogen
3.336615309	_2012	Nitrogen
3.843069838	_2012	Nitrogen
3.041284755	_2012	Nitrogen
3.440967925	_2012	Nitrogen
4.521388805	_2012	Nitrogen
3.725591696	_2012	Nitrogen
0.745451234	_2012	Nitrogen
3.255694388	_2012	Nitrogen
3.558643132	_2012	Nitrogen
4.195106921	_2012	Nitrogen
2.783706053	_2012	Nitrogen
3.278555512	_2012	Nitrogen
3.009681982	_2012	Nitrogen
1.778108889	_2012	Nitrogen
2.584009571	_2012	Nitrogen
4.231800871	_2012	Nitrogen
3.55909477	_2012	Nitrogen
4.191798557	_2012	Nitrogen
3.691018197	_2012	Nitrogen
3.202545875	_2012	Nitrogen
3.049116018	_2012	Heated
2.269500385	_2012	Heated
2.111110815	_2012	Heated
2.227134972	_2012	Heated
3.960484839	_2013	Control
3.780409968	_2013	Control
2.964775139	_2013	Control
3.843632005	_2013	Control
2.91422512	_2013	Control
3.124874012	_2013	Control
3.964333766	_2013	Control
2.82062138	_2013	Control
2.403052707	_2013	Control
3.742308664	_2013	Control
4.178490319	_2013	Control
3.144435539	_2013	Control
3.22758163	_2013	Control
4.400415188	_2013	Control
3.652508355	_2013	Control
3.849503928	_2013	Control
3.723994227	_2013	Control
2.560131564	_2013	Control
4.508194447	_2013	Control
4.795173772	_2013	Control
3.25901494	_2013	Control
3.883746792	_2013	Control
2.75565509	_2013	Control
3.584155092	_2013	Control
3.465430741	_2013	Control
4.601454527	_2013	Control
2.975082749	_2013	Control
3.649543641	_2013	Control
3.758257501	_2013	Control
3.391027656	_2013	Control
3.39635387	_2013	Control
3.544231754	_2013	Control
3.216804745	_2013	Control
3.031346567	_2013	Control
3.523400204	_2013	Control
4.320244134	_2013	Control
3.93184674	_2013	Control
3.746776453	_2013	Control
3.943811611	_2013	Control
3.236068126	_2013	Control
3.824569843	_2013	Control
3.564701105	_2013	Control
3.367862157	_2013	Control
4.021848994	_2013	Control
3.603881109	_2013	Control
3.489823357	_2013	Control
3.990221335	_2013	Control
4.386316274	_2013	Control
4.137801903	_2013	Control
3.327208257	_2013	Control
2.874349021	_2013	Control
4.248467163	_2013	Control
3.766682567	_2013	Control
3.893816771	_2013	Control
2.680852839	_2013	Control
2.964328108	_2013	Control
2.520740472	_2013	Control
3.123634031	_2013	Control
3.215577807	_2013	Control
2.820624924	_2013	Control
3.275031247	_2013	Control
4.120583883	_2013	Control
3.546477634	_2013	Control
4.011316059	_2013	Control
3.706575081	_2013	Control
4.373864764	_2013	Control
2.403890644	_2013	Control
3.658669972	_2013	Control
3.139056144	_2013	Control
3.128261427	_2013	Control
2.614539289	_2013	Control
2.174630689	_2013	Control
2.727524852	_2013	Control
1.969345647	_2013	Control
3.840659028	_2013	Control
3.408846862	_2013	Control
3.760172536	_2013	Control
3.260989404	_2013	Control
2.713281439	_2013	Control
2.453329415	_2013	Control
3.650665258	_2013	Control
3.461986613	_2013	Control
3.448202327	_2013	Control
2.074779728	_2013	Control
4.360792838	_2013	Control
2.104914814	_2013	Control
3.285126199	_2013	Control
3.277214237	_2013	Control
3.662200461	_2013	Control
3.377532129	_2013	Control
3.845478104	_2013	Control
4.18244302	_2013	Invasion
4.085326513	_2013	Invasion
3.865465824	_2013	Invasion
4.099295065	_2013	Invasion
3.822374678	_2013	Invasion
3.760001397	_2013	Invasion
3.629653786	_2013	Invasion
3.647229739	_2013	Invasion
3.571344844	_2013	Invasion
4.532369123	_2013	Invasion
3.426106739	_2013	Invasion
3.372366852	_2013	Invasion
3.886483355	_2013	Invasion
3.500720563	_2013	Invasion
3.587101411	_2013	Invasion
2.529326818	_2013	Invasion
3.556391475	_2013	Invasion
4.149480154	_2013	Invasion
3.495230169	_2013	Invasion
2.627794303	_2013	Invasion
3.967136061	_2013	Invasion
4.114176818	_2013	Invasion
3.827950809	_2013	Invasion
2.286926144	_2013	Invasion
1.91171824	_2013	Invasion
4.189935715	_2013	Invasion
4.014617432	_2013	Invasion
3.768983075	_2013	Invasion
3.681681545	_2013	Invasion
3.11562751	_2013	Invasion
3.261337315	_2013	Invasion
2.307563239	_2013	Invasion
2.185017406	_2013	Invasion
4.119320957	_2013	Invasion
3.910618711	_2013	Invasion
2.584946115	_2013	Invasion
3.380353518	_2013	Invasion
4.176249537	_2013	Invasion
2.911861146	_2013	Invasion
4.563431694	_2013	Invasion
4.087746401	_2013	Invasion
4.31964106	_2013	Invasion
4.362698753	_2013	Invasion
3.920539963	_2013	Invasion
2.778634279	_2013	Invasion
3.869860051	_2013	Invasion
4.128704127	_2013	Invasion
2.627441196	_2013	Invasion
3.322376637	_2013	Invasion
3.896375445	_2013	Invasion
3.982360988	_2013	Invasion
3.61179697	_2013	Invasion
2.469275049	_2013	Invasion
3.549902618	_2013	Invasion
3.359542611	_2013	Invasion
2.802053188	_2013	Invasion
3.083997	_2013	Invasion
3.561060522	_2013	Invasion
3.790276065	_2013	Invasion
2.679159239	_2013	Invasion
3.265984275	_2013	Invasion
3.956443929	_2013	Invasion
3.954909093	_2013	Invasion
3.911450348	_2013	Invasion
3.659561238	_2013	Invasion
3.846601182	_2013	Invasion
2.633511833	_2013	Invasion
3.004044117	_2013	Invasion
3.175338178	_2013	Invasion
3.37718612	_2013	Invasion
3.461611678	_2013	Invasion
3.380992014	_2013	Invasion
3.367897409	_2013	Invasion
3.906702347	_2013	Invasion
3.547054512	_2013	Invasion
4.032956489	_2013	Invasion
1.369452939	_2013	Invasion
3.622049689	_2013	Invasion
4.031501853	_2013	Invasion
2.821162243	_2013	Invasion
2.806946555	_2013	Invasion
2.460615877	_2013	Invasion
2.311489252	_2013	Invasion
2.476013377	_2013	Invasion
2.255893935	_2013	Invasion
3.24777445	_2013	Invasion
3.145354607	_2013	Invasion
4.095244872	_2013	Invasion
2.226354764	_2016	Control
3.296459046	_2016	Control
3.955096373	_2016	Control
3.000655578	_2016	Control
3.443851805	_2016	Control
2.750715538	_2016	Control
3.48571904	_2016	Control
3.303360304	_2016	Control
3.630447617	_2016	Control
3.637743892	_2016	Control
2.759406404	_2016	Control
3.619585286	_2016	Control
3.442229437	_2016	Control
3.269216908	_2016	Control
3.039211063	_2016	Control
3.128938452	_2016	Control
3.56469864	_2016	Control
2.304038257	_2016	Control
3.366532199	_2016	Control
2.219276094	_2016	Control
3.516864482	_2016	Control
3.576694532	_2016	Control
3.596344386	_2016	Control
2.105632048	_2016	Control
2.832054351	_2016	Control
2.606663978	_2016	Control
2.866501609	_2016	Control
3.170963287	_2016	Control
4.115640259	_2016	Control
1.602064867	_2016	Control
3.336240415	_2016	Control
1.753431467	_2016	Control
2.96078622	_2016	Control
2.153803584	_2016	Control
2.956712028	_2016	Control
2.471214461	_2016	Control
2.037813174	_2016	Control
3.838861377	_2016	Nitrogen
3.510845447	_2016	Nitrogen
3.347260826	_2016	Nitrogen
3.540761981	_2016	Nitrogen
2.597563985	_2016	Nitrogen
3.103831952	_2016	Nitrogen
4.06019336	_2016	Nitrogen
3.744278092	_2016	Nitrogen
3.541166517	_2016	Nitrogen
3.422350392	_2016	Nitrogen
3.559799632	_2016	Nitrogen
3.031196321	_2016	Nitrogen
3.316081248	_2016	Nitrogen
3.176973177	_2016	Nitrogen
2.710809052	_2016	Nitrogen
3.257799513	_2016	Nitrogen
3.544480806	_2016	Nitrogen
1.670914852	_2016	Nitrogen
3.668054305	_2016	Nitrogen
3.388327756	_2016	Nitrogen
3.396546993	_2016	Nitrogen
3.221465877	_2016	Nitrogen
2.919700861	_2016	Nitrogen
2.951009891	_2016	Nitrogen
2.448615333	_2016	Nitrogen
2.741220024	_2016	Nitrogen
3.354428115	_2016	Nitrogen
3.366119753	_2016	Nitrogen
2.889555591	_2016	Nitrogen
2.203121844	_2016	Nitrogen
1.608812817	_2016	Nitrogen
3.75230454	_2016	Nitrogen
3.160601635	_2016	Nitrogen
3.612749614	_2016	Nitrogen
3.533813457	_2016	Nitrogen
2.987609242	_2016	Nitrogen
2.214903145	_2016	Nitrogen
2.401082887	_2016	Nitrogen
1.982232528	_2016	Invasion
2.975917176	_2016	Invasion
1.457391323	_2016	Heated
2.334564399	_2016	Heated
2.466057892	_2016	Invasion
3.76121794	_2016	Invasion
2.276013762	_2016	Invasion
3.082628786	_2016	Invasion
2.633599598	_2016	Nitrogen
3.299855808	_2016	Nitrogen
1.440764534	_2016	Invasion
3.010650835	_2016	Invasion
3.064760929	_2016	Heated
1.72130945	_2016	Heated
1.800388214	_2016	Invasion
2.708770796	_2016	Invasion
3.372801981	_2016	Invasion
3.642998186	_2016	Invasion
2.664721724	_2016	Nitrogen
1.898998835	_2016	Nitrogen
2.654750387	_2016	Nitrogen
3.035310992	_2016	Nitrogen
2.435941875	_2016	Invasion
3.492195414	_2016	Invasion
2.54571391	_2016	Heated
2.799908318	_2016	Heated
1.950396332	_2016	Invasion
3.699563015	_2016	Invasion
1.217086991	_2016	Invasion
2.152008472	_2016	Invasion
2.273877266	_2016	Heated
2.654635541	_2016	Heated
1.640160978	_2016	Nitrogen
2.47351409	_2016	Nitrogen
1.515791425	_2016	Invasion
2.584127975	_2016	Invasion
2.704899348	_2016	Heated
3.807407207	_2016	Heated
3.164349122	_2019	Control
4.637144081	_2019	Control
3.97655767	_2019	Control
4.921018876	_2019	Control
4.0165785	_2019	Control
4.229738972	_2019	Control
3.855766726	_2019	Control
4.378174265	_2019	Control
3.622140715	_2019	Control
4.437055366	_2019	Control
3.165483048	_2019	Control
4.476561209	_2019	Control
4.37744923	_2019	Heated
4.04361897	_2019	Heated
3.207272187	_2019	Heated
3.924103237	_2019	Heated
3.962650245	_2019	Heated
4.420217516	_2019	Heated
3.487242706	_2019	Heated
4.325575406	_2019	Heated
4.357621273	_2019	Heated
4.075107991	_2019	Heated
4.115315933	_2019	Heated

")

Data = read.table(textConnection(Input),header=TRUE)

###  Order factors by the order in data frame
###  Otherwise, R will alphabetize them

Data$Year = factor(Data$Year,
                         levels=unique(Data$Year))

Data$treatment       = factor(Data$Grouped,
                         levels=unique(Data$Grouped))

###  Check the data frame
                         
library(psych)
headTail(Data)
str(Data)
summary(Data)   

### Remove unnecessary objects

rm(Input)

#In this first example, the model will be specified with the lmer function 
#in the package lme4.  The term (1|Town) in the model formula indicates that 
#Town should be treated as a random variable, with each level having its own 
#in the model.  The anova function in the package lmerTest is used to 
#produce p-values for the fixed effects.  The rand function in the package 
#lmerTest produces p-values for the random effects. 

library(lme4)
library(lmerTest)


model = lmer(Alpha ~ treatment + (1|Year),
             data=Data,
             REML=TRUE)


anova(model) #anova function in the package lmerTest is used to produce p-values for the fixed effects
rand(model) #rand function in the package lmerTest produces p-values for the random effects

#posthoc analysis 

library(multcomp)
library(lsmeans)

marginal = lsmeans(model, 
                   ~ treatment)

CLD = cld(marginal,
          alpha=0.05, 
          Letters=letters,        ### Use lower-case letters for .group
          adjust="tukey")         ###  Tukey-adjusted comparisons

CLD

pairs(marginal,
      adjust="tukey")

