# code source: https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/07--diversity_stats.html


#### set up ####


#clear environment
rm(list = ls())


#load packages
library(vegan)
library(tidyverse)
library(dplyr)

#### Alpha Diversity #####

#### 2015 Invasion Alpha#
# import data
DOD2015_invaded <- read_csv("DOD2015_invaded_transposed.csv")

#Calculate alpha + add new column
DOD2015_invaded$alpha <- diversity(DOD2015_invaded,
                                   MARGIN = 1,
                                   index = "shannon")

write.csv(DOD2015_invaded,"DOD2015_invaded_alpha.csv", row.names = FALSE)






#### 2017 Control Alpha #
# import data
DOD2015_uninvaded <- read_csv("DOD2015_uninvaded_transposed.csv")

#Calculate alpha + add new column
DOD2015_uninvaded$alpha <- diversity(DOD2015_uninvaded,
                                     MARGIN = 1,
                                     index = "shannon")

write.csv(DOD2015_uninvaded,"DOD2015_uninvaded_alpha.csv", row.names = FALSE)







#### 2017 Eradicated #
# import data
DOD2015_eradicated <- read_csv("DOD2015_eradicated_transposed.csv")

#Calculate alpha + add new column
DOD2015_eradicated$alpha <- diversity(DOD2015_eradicated,
                                      MARGIN = 1,
                                      index = "shannon")

write.csv(DOD2015_eradicated,"DOD2015_eradicated_alpha.csv", row.names = FALSE)
