
install.packages("betapart")
library(betapart)





otudata.2017 <- read.csv("DOD2017_otu_matix.csv")
otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OUT_ID")

beta.data.2017 <- beta.multi.abund(t(otu_data.2017), index.family="bray")



otudata.2015 <- read.csv("DOD2015_data.csv")
otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="OTUiD")

beta.data.2015 <- beta.multi.abund(t(otu_data.2015), index.family="bray")



otudata.oak <-read.csv("oak_data.2.csv")
otu_data.oak <- otudata.oak %>% remove_rownames %>% column_to_rownames(var="OTU.ID")
beta.data.oak <- beta.multi.abund(t(otu_data.oak), index.family="bray")


otudata.2018 <-read.csv("2018_data.csv")
otu_data.2018 <- otudata.2018 %>% remove_rownames %>% column_to_rownames(var="OTUID")
beta.data.2018 <- beta.multi.abund(t(otu_data.2018), index.family="bray")
