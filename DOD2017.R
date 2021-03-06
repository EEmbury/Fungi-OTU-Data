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





#### 2017 Control Alpha #
# import data
DOD2017_uninvaded <- read_csv("DOD2017_uninvaded_byrow.csv")

#Calculate alpha + add new column
DOD2017_uninvaded$alpha <- diversity(DOD2017_uninvaded,
                                     MARGIN = 1,
                                     index = "shannon")



#### 2017 Eradicated #
# import data
DOD2017_eradicated <- read_csv("DOD2017_eradicated_byrow_corrected.csv")

#Calculate alpha + add new column
DOD2017_eradicated$alpha <- diversity(DOD2017_eradicated,
                                      MARGIN = 1,
                                      index = "shannon")

anova_result <- aov(alpha ~ , DOD2017_eradicated)
summary(anova_result)

install.packages("agricolae")
library(agricolae)
tukey_result <- HSD.test(anova_result, group = TRUE)
print(tukey_result)

### ANOVA test ####

DOD2017_alpha <- read_csv("DOD2017_alpha.csv")

DOD2017_alpha_matix <- as.matrix(DOD2017_alpha)

DOD2017_alpha_list <- list(DOD2017_alpha)

anova_result <- aov(alpha ~ Plot_ID, DOD2017_alpha_list$invaded_alpha)
summary(anova_result)

### Still working this out


#### Beta Diversity attempts ####

DOD2017_combined <- read_csv("DOD2017_combined_by_type.csv")




beta_dist <- vegdist(DOD2017_combined[, DOD2017_combined$OTU1],
                       index = "bray")

beta_dist <- vegdist(t(obj$data$otu_rarefied[, DOD2017_combined$Type]),
                     index = "bray")


# take 2

install.packages("betapart")
  library(betapart)





otudata.2017 <- read.csv("DOD2017_otu_matix.csv")
#otutax.2017 <- read.csv("DOD2017_seperate_taxa.csv")
#samdata.2017 <- read.csv("DOD2017_metadata.csv")


#fullDOD2017 <- merge(otudata.2017, samdata.2017)

otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OUT_ID")

beta.data <- beta.multi.abund(t(otu_data.2017), index.family="bray")



otudata.2015 <- read.csv("DOD2015_data.csv")
otutax.2015 <- read.csv("DOD2015_seperate_taxa_2.csv")
samdata.2015 <- read.csv("DOD2015_metadata.csv")
otudata.2017 <- read.csv("DOD2017_otu_matix.csv")
otutax.2017 <- read.csv("DOD2017_seperate_taxa.csv")
samdata.2017 <- read.csv("DOD2017_metadata.csv")


otudata.oak <-read.csv("oak_data.2.csv")
otutaxa.oak <- read.csv("oak_seperate_taxa.csv")
samdata.oak <- read.csv('oak_metadata_2.csv')

otudata.2018 <-read.csv("2018_data.csv")
otutaxa.2018 <- read.csv("2018_seperate_taxa_2.csv")
samdata.2018 <- read.csv('2018_metadata.csv')


### take 3

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


view(beta_dist_eradicated)


### mds code  ####

# invaded

mds_invaded <- metaMDS(beta_dist_invaded)

mds_data_invaded <- as.data.frame(mds_invaded$points)

mds_data_invaded$SampleID <- rownames(mds_data_invaded)


library(ggplot2)
ggplot(mds_data_invaded, aes(x = MDS1, y = MDS2)) +
  ggtitle("Invaded")+
  geom_point(color='orangered1')

#uninvaded

mds_uninvaded <- metaMDS(beta_dist_uninvaded)

mds_data_uninvaded <- as.data.frame(mds_uninvaded$points)

mds_data_uninvaded$SampleID <- rownames(mds_data_uninvaded)


library(ggplot2)
ggplot(mds_data_uninvaded, aes(x = MDS1, y = MDS2)) +
  ggtitle("Uninvaded")+
  geom_point(color='lightseagreen')


# eradicated

mds_eradicated <- metaMDS(beta_dist_eradicated)

mds_data_eradicated <- as.data.frame(mds_eradicated$points)

mds_data_eradicated$SampleID <- rownames(mds_data_eradicated)


library(ggplot2)
ggplot(mds_data_eradicated, aes(x = MDS1, y = MDS2)) +
  ggtitle("Eradicated")+
  geom_point(color = 'mediumpurple3')


# 
# #together
# 
# together <- rbind(mds_data_invaded, mds_data_eradicated, mds_data_uninvaded)
# 
# library(ggplot2)
# ggplot(together, aes(x = MDS1, y = MDS2)) +
#   geom_point()
# 
# 
# 
# ggplot(aes(x = MDS1, y = MDS2)) + 
#   geom_point(data=mds_data_eradicated,  color='green') + 
#   geom_point(data=mds_data_invaded,  color='red') +
#   geom_point(data=mds_data_uninvaded,  color='blue')

#save pdf

pdf("DOD2017_beta.pdf") 
# This tells the graphic device (a.k.a., plotting area) in R that we want to save the plot as a pdf.
library(ggplot2)
ggplot(mds_data_invaded, aes(x = MDS1, y = MDS2)) +
  ggtitle("Invaded")+
  geom_point(color='orangered1')

library(ggplot2)
ggplot(mds_data_uninvaded, aes(x = MDS1, y = MDS2)) +
  ggtitle("Uninvaded")+
  geom_point(color='lightseagreen')


library(ggplot2)
ggplot(mds_data_eradicated, aes(x = MDS1, y = MDS2)) +
  ggtitle("Eradicated")+
  geom_point(color = 'mediumpurple3')

# Here is our code for the plot.  
dev.off()




### an attempt to make the data formated like the sample data ####

is.numeric(sample_data)
class(sample_data)

class(DOD2017_invaded)

DOD2017_invaded_TEST <- read_csv("DOD2017_invaded.csv")
grouped_df(DOD2017_invaded_TEST, vars = DOD2017_invaded_TEST$OTUID, drop = FALSE)
