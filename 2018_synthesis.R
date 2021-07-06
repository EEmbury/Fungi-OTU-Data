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