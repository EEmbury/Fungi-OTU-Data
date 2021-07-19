
install.packages("betapart")
library(betapart)
library(vegan)





otudata.2017 <- read.csv("DOD2017_otu_matix.csv")
otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OUT_ID")

beta.data.2017 <- bray.part(t(otu_data.2017))

mds.2017 <- metaMDS(beta.data.2017$bray)
mds_data_2017 <- as.data.frame(mds.2017$points)
write.csv(mds_data_2017, "2017_beta.csv")




samdata.2017 <- read.csv("DOD2017_metadata.csv")


mds_data_2017$SampleID <- rownames(mds_data_2017)
mds_data <- dplyr::left_join(mds_data_2017, samdata.2017)


library(ggplot2)
ggplot(mds_data, aes(x = MDS1, y = MDS2, color = SampleType.GM)) +
  geom_point()+
  stat_ellipse()









otudata.2015 <- read.csv("DOD2015_data.csv")
otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="OTUiD")

beta.data.2015 <- bray.part(t(otu_data.2015))



otudata.oak <-read.csv("oak_data.2.csv")
otu_data.oak <- otudata.oak %>% remove_rownames %>% column_to_rownames(var="OTU.ID")
beta.data.oak <- bray.part(t(otu_data.oak))


otudata.2018 <-read.csv("2018_data.csv")
otu_data.2018 <- otudata.2018 %>% remove_rownames %>% column_to_rownames(var="OTUID")
beta.data.2018 <- bray.part(t(otu_data.2018))



write.csv(mds_data_2017, "2017_beta.csv")
