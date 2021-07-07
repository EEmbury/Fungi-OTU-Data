# code source: https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/07--diversity_stats.html


#### set up ####
#clear environment
rm(list = ls())


#load packages
library(vegan)
library(tidyverse)
library(dplyr)


#Basic COde####
data <- read_csv("data.csv")

#Calculate alpha + add new column
data$alpha <- diversity(data,
                                     MARGIN = 1,
                                     index = "shannon")

write.csv(data,"name.csv", row.names = FALSE)


##### Alpha = Study #1 ####


####Garlic mustard + warming

Heatgm1 <- read_csv("2018_1_Heat_GM.csv")

Heatgm1$alpha <- diversity(Heatgm1,
                        MARGIN = 1,
                        index = "shannon")

write.csv(Heatgm1,"2018_1_Heat_GM_alpha.csv", row.names = FALSE)


####N0 (control N) + Garlic mustard 

NOGM1 <- read_csv("2018_1_N0_GM.csv")

#Calculate alpha + add new column
NOGM1$alpha <- diversity(NOGM1,
                        MARGIN = 1,
                        index = "shannon")

write.csv(NOGM1,"2018_1_N0_GM_alpha.csv", row.names = FALSE)



####N50 + Garlic mustard

N50GM1 <- read_csv("2018_1_N50_GM.csv")


#Calculate alpha + add new column
N50GM1$alpha <- diversity(N50GM1,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N50GM1,"2018_1_N50_GM_alpha.csv", row.names = FALSE)


#### Garlic mustard control

GM1 <- read_csv("2018_1_GM.csv")

#Calculate alpha + add new column
GM1$alpha <- diversity(GM1,
                        MARGIN = 1,
                        index = "shannon")

write.csv(GM1,"2018_1_GM_alpha.csv", row.names = FALSE)



##### Alpha = Study #2 ####

### Warming ###

warm2 <- read_csv("2018_2_warm.csv")

#Calculate alpha + add new column
warm2$alpha <- diversity(warm2,
                        MARGIN = 1,
                        index = "shannon")

write.csv(warm2,"2018_2_warm_alpha.csv", row.names = FALSE)


### control ###

control2 <- read_csv("2018_2_control.csv")

#Calculate alpha + add new column
control2$alpha <- diversity(control2,
                        MARGIN = 1,
                        index = "shannon")

write.csv(control2,"2018_2_control_alpha.csv", row.names = FALSE)



##### Alpha = Study #3 ####

###N0 treatment

N03 <- read_csv("2018_3_N0.csv")

#Calculate alpha + add new column
N03$alpha <- diversity(N03,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N03,"2018_3_N0_alpha.csv", row.names = FALSE)


###N50 treatment

N503 <- read_csv("2018_3_N50.csv")

#Calculate alpha + add new column
N503$alpha <- diversity(N503,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N503,"2018_3_N50_alpha.csv", row.names = FALSE)


### N150 Treatment

N1503 <- read_csv("2018_3_N150.csv")

#Calculate alpha + add new column
N1503$alpha <- diversity(N1503,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N1503,"2018_3_N150_alpha.csv", row.names = FALSE)


##### Alpha = Study #4 ####

### Control ###

control4 <- read_csv("2018_4_control.csv")

#Calculate alpha + add new column
control4$alpha <- diversity(control4,
                        MARGIN = 1,
                        index = "shannon")

write.csv(control4,"2018_4_control_alpha.csv", row.names = FALSE)


### Warmed ###

warmed4 <- read_csv("2018_4_warmed.csv")

#Calculate alpha + add new column
warmed4$alpha <- diversity(warmed4,
                        MARGIN = 1,
                        index = "shannon")

write.csv(warmed4,"2018_4_warmed_alpha.csv", row.names = FALSE)

##### Alpha = Study #5 ####

### N0 Treatment ###

N05 <- read_csv("2018_5_N0.csv")

#Calculate alpha + add new column
N05$alpha <- diversity(N05,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N05,"2018_5_N0_alpha.csv", row.names = FALSE)

### N50 Treatment ###

N505 <- read_csv("2018_5_N50.csv")

#Calculate alpha + add new column
N505$alpha <- diversity(N505,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N505,"2018_5_N50_alpha.csv", row.names = FALSE)


### N150 Treatment ###

N1505 <- read_csv("2018_5_N150.csv")

#Calculate alpha + add new column
N1505$alpha <- diversity(N1505,
                        MARGIN = 1,
                        index = "shannon")

write.csv(N1505,"2018_5_N150_alpha.csv", row.names = FALSE)
