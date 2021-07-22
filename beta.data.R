
install.packages("betapart")
library(betapart)
library(vegan)
library(data.table)
library(dplyr)
library(tidyverse)



####2017####################################################################
otudata.2017 <- read.csv("DOD2017_otu_matix_t.csv")


otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2017 <- bray.part(otu_data.2017)


mds.2017 <- metaMDS(beta.data.2017$bray)
mds_data_2017 <- as.data.frame(mds.2017$points)
#write.csv(mds_data_2017, "2017_beta.csv")




samdata.2017 <- read.csv("DOD2017_metadata.csv")
  # stress = 0.2746165 


mds_data_2017$SampleID <- rownames(mds_data_2017)
mds_data.17 <- dplyr::left_join(mds_data_2017, samdata.2017)


cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")

library(ggplot2)
p.2017 <- ggplot(mds_data.17, aes(x = MDS1, y = MDS2, color = SampleType.GM)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                          size=0.5, linetype="solid"))

p.2017 + labs(title = "Garlic Mustard 2017",
                  caption = "Stress = 0.2746165; P-value = 0.0010")2017


####2015##############################################################


otudata.2015 <- read.csv("DOD2015_data_t.csv")
otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="SampleID")

beta.data.2015 <- bray.part(otu_data.2015)

mds.2015 <- metaMDS(beta.data.2015$bray)
mds_data_2015 <- as.data.frame(mds.2015$points)
#write.csv(mds_data_2017, "2017_beta.csv")



samdata.2015 <- read.csv("DOD2015_metadata.csv")

mds_data_2015$SampleID <- rownames(mds_data_2015)
mds_data.15 <- dplyr::left_join(mds_data_2015, samdata.2015)


library(ggplot2)

p.2015 <- ggplot(mds_data.15, aes(x = MDS1, y = MDS2, color = SampleType.GM)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2015 + labs(title = "Garlic Mustard 2015",
              caption = "Stress = 0.2287022; P-value = 0.0010
 ")


####oak##########################################################
otudata.oak <-read.csv("oak_data.2.t.csv")
otu_data.oak <- otudata.oak %>% remove_rownames %>% column_to_rownames(var="SampleID")
beta.data.oak <- bray.part(otu_data.oak)

mds.oak <- metaMDS(beta.data.oak$bray)
mds_data_oak <- as.data.frame(mds.oak$points)
#write.csv(mds_data_2017, "2017_beta.csv")


samdata.oak <- read.csv('oak_metadata_2.csv')

mds_data_oak$SampleID <- rownames(mds_data_oak)
mds_data.oak <- dplyr::left_join(mds_data_oak, samdata.oak)



p.oak <- ggplot(mds_data.oak, aes(x = MDS1, y = MDS2, color = SampleType.N)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.oak + labs(title = "Oak Transplant",
              caption = "Stress = 0.1682101; P-value = 0.0010
 ")

####2018.gm########################################################
otudata.2018 <-read.csv("2018_GM_by_treatment.csv")
otu_data.2018 <- otudata.2018 %>% remove_rownames %>% column_to_rownames(var="OTUID")
beta.data.2018 <- bray.part(t(otu_data.2018))


mds.2018 <- metaMDS(beta.data.2018$bray)
mds_data_2018 <- as.data.frame(mds.2018$points)
#write.csv(mds_data_2017, "2017_beta.csv")

samdata.2018 <- read.csv('2018_metadata_GM.csv')

mds_data_2018$SampleID <- rownames(mds_data_2018)
mds_data.2018 <- dplyr::left_join(mds_data_2018, samdata.2018)


p.2018 <- ggplot(mds_data.2018, aes(x = MDS1, y = MDS2, color = SampleType.GM)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2018 + labs(title = "2018 Garlic Mustard",
             caption = "Stress = 0.1960017")



## take 2

otudata.2018 <-read.csv("2018_1_corrected.csv")
otu_data.2018 <- otudata.2018 %>% remove_rownames %>% column_to_rownames(var="OTUID")
beta.data.2018 <- bray.part(t(otu_data.2018))


mds.2018 <- metaMDS(beta.data.2018$bray)
mds_data_2018 <- as.data.frame(mds.2018$points)
#write.csv(mds_data_2017, "2017_beta.csv")

samdata.2018 <- read.csv('2018_corrected_metadata.csv')

mds_data_2018$SampleID <- rownames(mds_data_2018)
mds_data.2018 <- dplyr::left_join(mds_data_2018, samdata.2018)


p.2018 <- ggplot(mds_data.2018, aes(x = MDS1, y = MDS2, color = Treatment.ns)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  #scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2018 + labs(title = "2018 Garlic Mustard",
              caption = "Stress = 0.2568298")\

#####2018N5#######

otudata.2018.N <-read.csv("2018_5_Nitrogen_t.csv")
otu_data.2018.N <- otudata.2018.N %>% remove_rownames %>% column_to_rownames(var="SampleID")
beta.data.2018.N <- bray.part(otu_data.2018.N)


mds.2018.N <- metaMDS(beta.data.2018.N$bray)
mds_data_2018.N <- as.data.frame(mds.2018.N$points)
#write.csv(mds_data_2017, "2017_beta.csv")

samdata.2018.N <- read.csv('2018_metadata_N_5.csv')

mds_data_2018.N$SampleID <- rownames(mds_data_2018.N)
mds_data.2018.N <- dplyr::left_join(mds_data_2018.N, samdata.2018.N)

p.2018.N <- ggplot(mds_data.2018.N, aes(x = MDS1, y = MDS2, color = SampleType.N)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2018.N + labs(title = "2018 Nitrogen: Study 5",
              caption = "Stress = 0.1999836; P-value = 0.0010
")


#######2018N3##################################

otudata.2018.N3 <-read.csv("2018_3_Nitrogen_t.csv")
otu_data.2018.N3 <- otudata.2018.N3 %>% remove_rownames %>% column_to_rownames(var="SampleID")
beta.data.2018.N3 <- bray.part(t(otu_data.2018.N3))


mds.2018.N3 <- metaMDS(beta.data.2018.N3$bray)
mds_data_2018.N3 <- as.data.frame(mds.2018.N3$points)
#write.csv(mds_data_2017, "2017_beta.csv")

samdata.2018.N3 <- read.csv('2018_metadata_N_3.csv')


mds_data_2018.N3$SampleID <- rownames(mds_data_2018.N3)
mds_data.2018.N3 <- dplyr::left_join(mds_data_2018.N3, samdata.2018.N3)

p.2018.N3 <- ggplot(mds_data.2018.N3, aes(x = MDS1, y = MDS2, color = SampleType.N)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2018.N3 + labs(title = "2018 Nitrogen: Study 3",
                caption = "Stress = 0.1294216")



######2018H4###################################
otudata.2018.H4 <-read.csv("2018_4_heating_type.csv")
otu_data.2018.H4 <- otudata.2018.H4 %>% remove_rownames %>% column_to_rownames(var="OTUID")
beta.data.2018.H4 <- bray.part(t(otu_data.2018.H4))


mds.2018.H4 <- metaMDS(beta.data.2018.H4$bray)
mds_data_2018.H4 <- as.data.frame(mds.2018.H4$points)
#write.csv(mds_data_2017, "2017_beta.csv")

samdata.2018.H4 <- read.csv('2018_metadata_heat_S.csv')


mds_data_2018.H4$SampleID <- rownames(mds_data_2018.H4)
mds_data.2018.H4 <- dplyr::left_join(mds_data_2018.H4, samdata.2018.H4)

p.2018.H4 <- ggplot(mds_data.2018.H4, aes(x = MDS1, y = MDS2, color = SampleType.Heat)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2018.H4 + labs(title = "2018 Heated: Study 4",
                 caption = "Stress =  0.1822467")

#######2018H2###################################

otudata.2018.H <-read.csv("2018_2_heated_type.csv")
otu_data.2018.H <- otudata.2018.H %>% remove_rownames %>% column_to_rownames(var="OTUID")
beta.data.2018.H <- bray.part(t(otu_data.2018.H))


mds.2018.H <- metaMDS(beta.data.2018.H$bray)
mds_data_2018.H <- as.data.frame(mds.2018.H$points)
#write.csv(mds_data_2017, "2017_beta.csv")

samdata.2018.H <- read.csv('2018_metadata_heat_c.csv')


mds_data_2018.H$SampleID <- rownames(mds_data_2018.H)
mds_data.2018.H <- dplyr::left_join(mds_data_2018.H, samdata.2018.H)

p.2018.H <- ggplot(mds_data.2018.H, aes(x = MDS1, y = MDS2, color = SampleType.Heat)) +
  geom_point(size= 3)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))

p.2018.H + labs(title = "2018 Heated: Study 2",
                 caption = "Stress =  0.1564374")


