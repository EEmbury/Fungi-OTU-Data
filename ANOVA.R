

##### https://rfunctions.blogspot.com/2016/08/measuring-and-comparing-beta-diversity.html
#clear environment
rm(list = ls())


library(dplyr)
library(betapart)
library(vegan)
install.packages("PERMANOVA")
library(PERMANOVA)


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


#write.csv(anova.2017, "beta_anova.csv", row.names = FALSE)



### Permanova attempt:

otudata.2017 <- read.csv("DOD2017_otu_matix_t.csv")

otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="SampleID")

samdata.2017 <- read.csv("DOD2017_metadata.csv")
rownames(samdata.2017) <-samdata.2017$SampleID

group_data.17 <- dplyr::left_join(otudata.2017, samdata.2017)

groups.2017 <- factor(group_data.17$SampleType.GM)
groups.2017

bray.2017 <- DistContinuous(otu_data.2017, coef="Bray_Curtis")

permanova.2017 <- PERMANOVA(bray.2017, groups.2017, CoordPrinc = TRUE)

plot(permanova.2017)


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

#write.csv(anova.2015, "2015_beta_anova.csv", row.names = FALSE)


#### Permanova

otudata.2015 <- read.csv("DOD2015_data_t.csv")

otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="SampleID")

samdata.2015 <- read.csv("DOD2015_metadata.csv")
rownames(samdata.2015) <-samdata.2015$SampleID

group_data.15 <- dplyr::left_join(otudata.2015, samdata.2015)

groups.2015 <- factor(group_data.15$SampleType.GM)
groups.2015

bray.2015 <- DistContinuous(otu_data.2015, coef="Bray_Curtis")

permanova.2015 <- PERMANOVA(bray.2015, groups.2015, CoordPrinc = TRUE)

plot(permanova.2015)

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

#write.csv(anova.oak, "oak_beta_anova.csv", row.names = FALSE)


#### permanova


otudata.oak <- read.csv("oak_data.2.t.csv")

otu_data.oak <- otudata.oak %>% remove_rownames %>% column_to_rownames(var="SampleID")

samdata.oak <- read.csv("oak_metadata_2.csv")
rownames(samdata.oak) <-samdata.oak$SampleID

group_data.oak <- dplyr::left_join(otudata.oak, samdata.oak)

groups.oak <- factor(group_data.oak$SampleType.N)
groups.oak

bray.oak <- DistContinuous(otu_data.oak, coef="Bray_Curtis")

permanova.oak <- PERMANOVA(bray.oak, groups.oak, CoordPrinc = TRUE)

plot(permanova.oak)


##### 2018 GM ######

# need to figure out nested anova

otudata.2018gm <- read.csv("2018_1_corrected_t.csv")

otu_data.2018gm <- otudata.2018gm %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2018gm <- bray.part(otu_data.2018gm)


samdata.2018gm <- read.csv("2018_corrected_metadata.csv")
rownames(samdata.2018gm) <-samdata.2018gm$SampleID




groups.2018gm <- factor(samdata.2018gm$Treatment)

groups.2018gm.2 <- factor(samdata.2018gm$Invasion)

groups.2018gm

bd.2018gm.treatment <-betadisper(beta.data.2018gm$bray, groups.2018gm)
bd.2018gm.invasion <-betadisper(beta.data.2018gm$bray, groups.2018gm.2)

anova.2018gm <- aov(bd.2018gm)

boxplot(bd.2018gm)



ANOVA1 <-aov(otudata.2018gm$SampleID ~ bd.2018gm.invasion / bd.2018gm.treatment)


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

#write.csv(anova.2018N5, "2018N5_beta_anova.csv", row.names = FALSE)


#permanova


otudata.2018N5 <- read.csv("2018_5_Nitrogen_t.csv")

otu_data.2018N5 <- otudata.2018N5 %>% remove_rownames %>% column_to_rownames(var="SampleID")


samdata.2018N5 <- read.csv("2018_metadata_N_5.csv")
rownames(samdata.2018N5) <-samdata.2018N5$SampleID

group_data.2018N5 <- dplyr::left_join(otudata.2018N5, samdata.2018N5)

groups.2018N5 <- factor(group_data.2018N5$SampleType.N)
groups.2018N5

bray.2018N5 <- DistContinuous(otu_data.2018N5, coef="Bray_Curtis")

permanova.2018N5 <- PERMANOVA(bray.2018N5, groups.2018N5, CoordPrinc = TRUE)

plot(permanova.2018N5)


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

#write.csv(anova.2018N3, "2018N3_beta_anova.csv", row.names = FALSE)


### permanova

otudata.2018N3 <- read.csv("2018_3_Nitrogen_t.csv")

otu_data.2018N3 <- otudata.2018N3 %>% remove_rownames %>% column_to_rownames(var="SampleID")



samdata.2018N3 <- read.csv("2018_metadata_N_3.csv")
rownames(samdata.2018N3) <-samdata.2018N3$SampleID

group_data.2018N3 <- dplyr::left_join(otudata.2018N3, samdata.2018N3)

groups.2018N3 <- factor(group_data.2018N3$SampleType.N)
groups.2018N3

bray.2018N3 <- DistContinuous(otu_data.2018N3, coef="Bray_Curtis")

permanova.2018N3 <- PERMANOVA(bray.2018N3, groups.2018N3, CoordPrinc = TRUE)

plot(permanova.2018N3)



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


#write.csv(anova.2018H4, "2018H4_beta_anova.csv", row.names = FALSE)



#### permanova


otudata.2018H4 <- read.csv("2018_4_heating_t.csv")

otu_data.2018H4 <- otudata.2018H4 %>% remove_rownames %>% column_to_rownames(var="SampleID")


samdata.2018H4 <- read.csv("2018_metadata_heat_S.csv")
rownames(samdata.2018H4) <-samdata.2018H4$SampleID

group_data.2018H4 <- dplyr::left_join(otudata.2018H4, samdata.2018H4)

groups.2018H4 <- factor(group_data.2018H4$SampleType.Heat)
groups.2018H4

bray.2018H4 <- DistContinuous(otu_data.2018H4, coef="Bray_Curtis")

permanova.2018H4 <- PERMANOVA(bray.2018H4, groups.2018H4, CoordPrinc = TRUE)

plot(permanova.2018H4)

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

#write.csv(anova.2018H2, "2018H2_beta_anova.csv", row.names = FALSE)


####  permanova

otudata.2018H2 <- read.csv("2018_2_heated_t.csv")

otu_data.2018H2 <- otudata.2018H2 %>% remove_rownames %>% column_to_rownames(var="SampleID")


samdata.2018H2 <- read.csv("2018_metadata_heat_c.csv")
rownames(samdata.2018H2) <-samdata.2018H2$SampleID


group_data.2018H2 <- dplyr::left_join(otudata.2018H2, samdata.2018H2)

groups.2018H2 <- factor(group_data.2018H2$SampleType.Heat)
groups.2018H2

bray.2018H2 <- DistContinuous(otu_data.2018H2, coef="Bray_Curtis")

permanova.2018H2 <- PERMANOVA(bray.2018H2, groups.2018H2, CoordPrinc = TRUE)

plot(permanova.2018H2)
