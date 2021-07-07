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


#####Alpha diversity analysis####

### HN/LN Treatment ###

HNLN <- read_csv("Oak_HN_LN.csv")

HNLN$alpha <- diversity(HNLN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(HNLN,"Oak_HN_LN_alpha.csv", row.names = FALSE)

### HN/CN Treatment ###

HNCN <- read_csv("oak_HN_CN.csv")

#Calculate alpha + add new column
HNCN$alpha <- diversity(HNCN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(HNCN,"oak_HN_CN_alpha.csv", row.names = FALSE)

### HN/HN Treatment ###

HNHN <- read_csv("oak_HN_HN.csv")

#Calculate alpha + add new column
HNHN$alpha <- diversity(HNHN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(HNHN,"oak_HN_HN_Alpha.csv", row.names = FALSE)


### LN/CN Treatment ###

LNCN <- read_csv("oak_LN_CN.csv")

#Calculate alpha + add new column
LNCN$alpha <- diversity(LNCN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(LNCN,"oak_LN_CN_alpha.csv", row.names = FALSE)

### LN/LN Treatment ###

LNLN <- read_csv("oak_LN_LN.csv")

#Calculate alpha + add new column
LNLN$alpha <- diversity(LNLN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(LNLN,"oak_LN_LN_alpha.csv", row.names = FALSE)

### LN/HN Treatment ###

LNHN <- read_csv("oak_LN_HN.csv")

#Calculate alpha + add new column
LNHN$alpha <- diversity(LNHN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(LNHN,"oak_LN_HN_alpha.csv", row.names = FALSE)

### CN/CN Treatment ###

CNCN <- read_csv("oak_CN_CN.csv")

#Calculate alpha + add new column
CNCN$alpha <- diversity(CNCN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(CNCN,"oak_CN_CN_alpha.csv", row.names = FALSE)

### CN/HN Treatment ###

CNHN <- read_csv("oak_CN_HN.csv")

#Calculate alpha + add new column
CNHN$alpha <- diversity(CNHN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(CNHN,"oak_CN_HN_alpha.csv", row.names = FALSE)

### CN/LN Treatment ###

CNLN <- read_csv("oak_CN_LN.csv")

#Calculate alpha + add new column
CNLN$alpha <- diversity(CNLN,
                        MARGIN = 1,
                        index = "shannon")

write.csv(CNLN,"oak_CN_LN_alpha.csv", row.names = FALSE)
