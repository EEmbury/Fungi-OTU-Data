# code source: https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/07--diversity_stats.html

#clear environment
rm(list = ls())

#load packages
library(vegan)
library(tidyverse)
library(dplyr)


#### 2017 Invasion Alpha####
# import data
DOD2017_invaded <- read_csv("DOD2017_invaded_byrow.csv")

#Calculate alpha + add new column
DOD2017_invaded$alpha <- diversity(DOD2017_invaded,
                                   MARGIN = 1,
                                   index = "shannon")


hist(DOD2017_invaded$alpha)


#### 2017 Control Alpha ####
# import data
DOD2017_uninvaded <- read_csv("DOD2017_uninvaded_byrow.csv")

#Calculate alpha + add new column
DOD2017_uninvaded$alpha <- diversity(DOD2017_uninvaded,
                                     MARGIN = 1,
                                     index = "shannon")

hist(DOD2017_uninvaded$alpha)


#### 2017 Eradicated #### 
# import data
DOD2017_eradicated <- read_csv("DOD2017_eradicated_byrow.csv")

#Calculate alpha + add new column
DOD2017_eradicated$alpha <- diversity(DOD2017_eradicated,
                                      MARGIN = 1,
                                      index = "shannon")


hist(DOD2017_eradicated$alpha)