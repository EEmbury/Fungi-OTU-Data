# code source: https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/07--diversity_stats.html


# example data
load("clean_data.Rdata")


#clear environment
rm(list = ls())

#load packages
library(vegan)
library(tidyverse)
library(dplyr)

#### Alpha Diversity #####

#### 2017 Invasion Alpha#
# import data
DOD2017_invaded <- read_csv("DOD2017_invaded_byrow.csv")

#Calculate alpha + add new column
DOD2017_invaded$alpha <- diversity(DOD2017_invaded,
                                   MARGIN = 1,
                                   index = "shannon")


hist(DOD2017_invaded$alpha)


#### 2017 Control Alpha #
# import data
DOD2017_uninvaded <- read_csv("DOD2017_uninvaded_byrow.csv")

#Calculate alpha + add new column
DOD2017_uninvaded$alpha <- diversity(DOD2017_uninvaded,
                                     MARGIN = 1,
                                     index = "shannon")

hist(DOD2017_uninvaded$alpha)


#### 2017 Eradicated #
# import data
DOD2017_eradicated <- read_csv("DOD2017_eradicated_byrow_corrected.csv")

#Calculate alpha + add new column
DOD2017_eradicated$alpha <- diversity(DOD2017_eradicated,
                                      MARGIN = 1,
                                      index = "shannon")


hist(DOD2017_eradicated$alpha)

### ANOVA test ####

DOD2017_alpha <- read_csv("DOD2017_alpha.csv")

DOD2017_alpha_matix <- as.matrix(DOD2017_alpha)

DOD2017_alpha_list <- list(DOD2017_alpha)

anova_result <- aov(alpha ~ Plot_ID, DOD2017_alpha_list$invaded_alpha)
summary(anova_result)

### Still working this out


#### Beta Diversity ####


# Beta Invaded #
beta_dist_invaded <- vegdist(DOD2017_invaded,
                     index = "bray")

#Beta Uninvaded #
beta_dist_uninvaded <- vegdist(DOD2017_uninvaded,
                             index = "bray")

#Beta eradicated #
beta_dist_eradicated <- vegdist(DOD2017_eradicated,
                             index = "bray")

#### mds data ####




