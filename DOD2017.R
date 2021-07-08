# code source: https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/07--diversity_stats.html


#### set up ####

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


#### Beta Diversity attempts ####

DOD2017_combined <- read_csv("DOD2017_combined_by_type.csv")


beta_dist <- vegdist(DOD2017_combined[, DOD2017_combined$Type],
                       index = "bray")

beta_dist <- vegdist(t(obj$data$otu_rarefied[, DOD2017_combined$Type]),
                     index = "bray")


# take 2

install.packages("betapart")
  library(betapart)


beta.data <- beta.multi(DOD2017_combined, index.family="bray")


install.packages("adespatial")
library(adespatial)

beta.data.2 <- beta.div(
  DOD2017_combined,
  method = "hellinger",
  sqrt.D = FALSE,
  samp = TRUE,
  nperm = 999,
  adj = TRUE,
  save.D = FALSE,
  clock = FALSE
)




#### actual beta ####

#invaded
DOD2017_invaded <- read_csv("DOD2017_invaded_byrow.csv")

beta_dist_invaded <- vegdist(DOD2017_invaded,
                     index = "bray")

#uninvaded
DOD2017_uninvaded <- read_csv("DOD2017_uninvaded_byrow.csv")

beta_dist_uninvaded <- vegdist(DOD2017_uninvaded,
                             index = "bray")

#eradicated
DOD2017_eradicated <- read_csv("DOD2017_eradicated_byrow_corrected.csv")

beta_dist_eradicated <- vegdist(DOD2017_eradicated,
                               index = "bray")


### mds code  ####

# invaded

mds_invaded <- metaMDS(beta_dist_invaded)

mds_data_invaded <- as.data.frame(mds_invaded$points)

mds_data_invaded$SampleID <- rownames(mds_data_invaded)


library(ggplot2)
ggplot(mds_data_invaded, aes(x = MDS1, y = MDS2)) +
  geom_point()

#uninvaded

mds_uninvaded <- metaMDS(beta_dist_uninvaded)

mds_data_uninvaded <- as.data.frame(mds_uninvaded$points)

mds_data_uninvaded$SampleID <- rownames(mds_data_uninvaded)


library(ggplot2)
ggplot(mds_data_uninvaded, aes(x = MDS1, y = MDS2)) +
  geom_point()


# eradicated

mds_eradicated <- metaMDS(beta_dist_eradicated)

mds_data_eradicated <- as.data.frame(mds_eradicated$points)

mds_data_eradicated$SampleID <- rownames(mds_data_eradicated)


library(ggplot2)
ggplot(mds_data_eradicated, aes(x = MDS1, y = MDS2)) +
  geom_point()

