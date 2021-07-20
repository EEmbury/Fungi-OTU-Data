########################################################################
otudata.2017 <- read.csv("DOD2017_otu_matix.csv")

otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OUT_ID")
otu_data.2017.t <- transpose(otu_data.2017)
rownames(otu_data.2017.t) <- colnames(otu_data.2017)
colnames(otu_data.2017.t) <- rownames(otu_data.2017)

# beta.data.2017 <- bray.part(t(otu_data.2017))
# 
# 
# mds.2017 <- metaMDS(beta.data.2017$bray)
# mds_data_2017 <- as.data.frame(mds.2017$points)
# #write.csv(mds_data_2017, "2017_beta.csv")




samdata.2017 <- read.csv("DOD2017_metadata.csv")
sam_data.2017 <- samdata.2017 %>% remove_rownames %>% column_to_rownames(var="SampleID")

sam_data.2017.t <- transpose(sam_data.2017)

rownames(sam_data.2017.t) <- colnames(sam_data.2017)
colnames(sam_data.2017.t) <- rownames(sam_data.2017)
# stress = 0.2746165 

# 
# mds_data_2017$SampleID <- rownames(mds_data_2017)
# mds_data.17 <- dplyr::left_join(mds_data_2017, samdata.2017)


aov(otudata.2017.t$OUT_ID ~ samdata.2017$SampleType.GM)




#attempt #2 ########
library(betapart)
library(vegan)
library(data.table)

otudata.2017 <- read.csv("DOD2017_otu_matix.csv")
otudata.2017.t <- transpose(otu_data.2017)
rownames(otudata.2017.t) <- colnames(otu_data.2017)
colnames(otudata.2017.t) <- rownames(otu_data.2017)

groups <- factor(c(rep(1,45), rep(46,87), rep(88,132)), labels = c("Eradicated","Invaded", "Uninvaded"))
groups

dist<-bray.part(otudata.2017.t)

bd<-betadisper(dist[[3]],groups)

otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OUT_ID")


# samdata.2017 <- read.csv("DOD2017_metadata.csv")
# 
# rownames(samdata.2017) <- samdata.2017$SampleID 
# 
# sam_data.17 <- dplyr::left_join(otudata.2017.t, samdata.2017)


# mds.2017 <- metaMDS(beta.data.2017$bray)
# mds_data_2017 <- as.data.frame(mds.2017$points)
#write.csv(mds_data_2017, "2017_beta.csv")


#beta.data.2017 <- bray.part(t(otu_data.2017))

samdata.2017 <- read.csv("DOD2017_metadata.csv")
# stress = 0.2746165 


mds_data_2017$SampleID <- rownames(mds_data_2017)
mds_data.17 <- dplyr::left_join(mds_data_2017, samdata.2017)


########### attempt 3 ##########

##### https://rfunctions.blogspot.com/2016/08/measuring-and-comparing-beta-diversity.html

library(dplyr)

otudata.2017 <- read.csv("DOD2017_otu_matix_t.csv")

otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2017 <- bray.part(otu_data.2017)


samdata.2017 <- read.csv("DOD2017_metadata.csv")
rownames(samdata.2017) <-samdata.2017$SampleID



test <- dplyr::left_join(otudata.2017, samdata.2017)  ### run this line with the name for importing the csv


groups <- factor(samdata.2017$SampleType.GM)
groups

bd<-betadisper(beta.data.2017$bray,groups)

anova(bd)

boxplot(bd)
