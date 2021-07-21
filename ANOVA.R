

##### https://rfunctions.blogspot.com/2016/08/measuring-and-comparing-beta-diversity.html
#clear environment
rm(list = ls())


library(dplyr)
library(betapart)
library(vegan)


##### 2017 #####

otudata.2017 <- read.csv("DOD2017_otu_matix_t.csv")

otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2017 <- bray.part(otu_data.2017)


samdata.2017 <- read.csv("DOD2017_metadata.csv")
rownames(samdata.2017) <-samdata.2017$SampleID



#2017 <- dplyr::left_join(otudata.2017, samdata.2017)  ### run this line with the name for importing the csv


groups.2017 <- factor(samdata.2017$SampleType.GM)
groups.2017

bd.2017 <-betadisper(beta.data.2017$bray,groups.2017)

anova.2017 <- anova(bd.2017)

boxplot(bd.2017)


#### 2015 ####

otudata.2015 <- read.csv("DOD2015_data_t.csv")

otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2015 <- bray.part(otu_data.2015)


samdata.2015 <- read.csv("DOD2015_metadata.csv")
rownames(samdata.2015) <-samdata.2015$SampleID



#2015 <- dplyr::left_join(otudata.2015, samdata.2015)  ### run this line with the name for importing the csv


groups.2015 <- factor(samdata.2015$SampleType.GM)
groups.2015

bd.2015 <-betadisper(beta.data.2015$bray,groups.2015)

anova.2015 <- anova(bd.2015)

boxplot(bd.2015)


#### oak #####

otudata.oak <- read.csv("oak_data.2.t.csv")

otu_data.oak <- otudata.oak %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.oak <- bray.part(otu_data.oak)


samdata.oak <- read.csv("oak_metadata_2.csv")
rownames(samdata.oak) <-samdata.oak$SampleID


groups.oak <- factor(samdata.oak$SampleType.N)
groups.oak

bd.oak <-betadisper(beta.data.oak$bray,groups.oak)

anova.oak <- anova(bd.oak)

boxplot(bd.oak)

##### 2018 GM ######

# need to figure out nested anova

otudata.2018gm <- read.csv("2018_1_corrected_t.csv")

otu_data.2018gm <- otudata.2018gm %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2018gm <- bray.part(otu_data.2018gm)


samdata.2018gm <- read.csv("2018_corrected_metadata.csv")
rownames(samdata.2018gm) <-samdata.2018gm$SampleID

samdata.2018gm$Treatment <- paste(samdata.2018gm$Warming, samdata.2018gm$Nitrogen, samdata.2018gm$Invasion, samdata.2018gm$Soil_type)


groups.2018gm <- factor(samdata.2018gm$Treatment)
groups.2018gm

bd.2018gm <-betadisper(beta.data.2018gm$bray, groups.2018gm)

anova.2018gm <- anova(bd.2018gm)

boxplot(bd.2018gm)


#### 2018 5 N ######

otudata.2018N5 <- read.csv("2018_5_Nitrogen_t.csv")

otu_data.2018N5 <- otudata.2018N5 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2018N5 <- bray.part(otu_data.2018N5)


samdata.2018N5 <- read.csv("2018_metadata_N_5.csv")
rownames(samdata.2018N5) <-samdata.2018N5$SampleID


groups.2018N5 <- factor(samdata.2018N5$SampleType.N)
groups.2018N5

bd.2018N5 <-betadisper(beta.data.2018N5$bray,groups.2018N5)

anova.2018N5 <- anova(bd.2018N5)

boxplot(bd.2018N5)


###### 2018 3 N ######

otudata.2018N3 <- read.csv("2018_3_Nitrogen_t.csv")

otu_data.2018N3 <- otudata.2018N3 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2018N3 <- bray.part(otu_data.2018N3)


samdata.2018N3 <- read.csv("2018_metadata_N_3.csv")
rownames(samdata.2018N3) <-samdata.2018N3$SampleID


groups.2018N3 <- factor(samdata.2018N3$SampleType.N)
groups.2018N3

bd.2018N3 <-betadisper(beta.data.2018N3$bray,groups.2018N3)

anova.2018N3 <- anova(bd.2018N3)

boxplot(bd.2018N3)


##### 2018 4 H ######

otudata.2018H4 <- read.csv("2018_4_heating_t.csv")

otu_data.2018H4 <- otudata.2018H4 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2018H4 <- bray.part(otu_data.2018H4)


samdata.2018H4 <- read.csv("2018_metadata_heat_S.csv")
rownames(samdata.2018H4) <-samdata.2018H4$SampleID


groups.2018H4 <- factor(samdata.2018H4$SampleType.Heat)
groups.2018H4

bd.2018H4 <-betadisper(beta.data.2018H4$bray,groups.2018H4)

anova.2018H4 <- anova(bd.2018H4)

boxplot(bd.2018H4)

##### 2018 2 H ######

otudata.2018H2 <- read.csv("2018_2_heated_t.csv")

otu_data.2018H2 <- otudata.2018H2 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2018H2 <- bray.part(otu_data.2018H2)


samdata.2018H2 <- read.csv("2018_metadata_heat_c.csv")
rownames(samdata.2018H2) <-samdata.2018H2$SampleID


groups.2018H2 <- factor(samdata.2018H2$SampleType.Heat)
groups.2018H2

bd.2018H2 <-betadisper(beta.data.2018H2$bray,groups.2018H2)

anova.2018H2 <- anova(bd.2018H2)

boxplot(bd.2018H2)
