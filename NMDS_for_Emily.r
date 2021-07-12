#clear environment
rm(list = ls())

# ### Original Code ####
# 
# ##################################NMDS all VOCs
# 
# otu_rel <- read.csv("for_NMDS_both_years.csv", header = T, sep = ",")
# View(otu_rel)
# dim(otu_rel) ####58, 175
# comm.num <- otu_rel[ ,5:176]
# View(comm.num)
# set.seed(200)
# library(vegan)
# otu.nms_1 <- metaMDS(comm.num, distance = "bray", trymax = 2000, autotransform = F)
# otu.nms_1
# otu.nms_2_test <- otu_rel[ ,1:4]
# View(otu.nms_2)
# MDS1 = otu.nms_1$points[,1]
# MDS1
# MDS2 = otu.nms_1$points[,2]
# MDS2
# NMDS = data.frame(MDS1 = MDS1, MDS2 = MDS2, treatment = otu.nms_2_test$type, month = otu.nms_2_test$month)
# library(ggplot2)
# 
# 
# plot <- qplot(MDS1, MDS2, data=NMDS, color=treatment, alpha=0.5, shape=month, size=1)
# plot
# 
# library(RColorBrewer)
# 
# cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")
# 
# 
# VOCs_ALL <- plot + 
#   theme(panel.grid = element_blank(),
#         panel.background = element_rect(fill = "white"),
#         panel.border = element_rect(color = "black", fill = NA, size = 0.5),
#         axis.title.x = element_text(color="black", vjust=1),
#         axis.title.y = element_text(color="black" , vjust=1)) +
#   scale_color_manual(values = cbbPalette) +
#   theme(strip.background = element_rect(colour="black", fill="white",
#                                         size=0.5, linetype="solid"))
# 
# VOCs_ALL
# jpeg("NMDS_per_month.jpeg",height=6,width=10,units = 'in', res = 600)#height in inches, resolution 600 dpi
# plot(VOCs_ALL)
# dev.off()



### DOD 2017 ####

otu_rel_DOD_2017 <- read.csv("DOD2017_combined_by_type.csv", header = T, sep = ",")
View(otu_rel_DOD_2017)
dim(otu_rel_DOD_2017) ####132, 1877
comm.num.DOD.2017 <- otu_rel_DOD_2017[ ,2:1877]
View(comm.num.DOD.2017)
set.seed(200)
library(vegan)
otu.nms_1_2017 <- metaMDS(comm.num.DOD.2017, distance = "bray", trymax = 2000, autotransform = F)
otu.nms_1_2017
otu.nms_2_2017 <- otu_rel_DOD_2017[ ,1:1]
View(otu.nms_2_2017)
MDS1.2017 = otu.nms_1_2017$points[,1]
MDS1.2017
MDS2.2017 = otu.nms_1_2017$points[,2]
MDS2.2017
NMDS = data.frame(MDS1 = MDS1.2017, MDS2 = MDS2.2017, Treatment = otu_rel_DOD_2017$Type)
library(ggplot2)


plot.2017 <- qplot(MDS1.2017, MDS2.2017, data=NMDS, main = "2017 Garlic Mustard", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
plot.2017 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD <- plot + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
        stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))


DOD
jpeg("DOD2017.jpeg",height=6,width=10,units = 'in', res = 600)#height in inches, resolution 600 dpi
plot(DOD)
dev.off()

### DOD 2015 ####

otu_rel_DOD_2015 <- read.csv("DOD2015_by_treatment.csv", header = T, sep = ",")
View(otu_rel_DOD_2015)
dim(otu_rel_DOD_2015) ####64, 4225
comm.num.DOD.2015 <- otu_rel_DOD_2015[ ,2:4225]
View(comm.num.DOD.2015)
set.seed(200)
library(vegan)
otu.nms_1_2015 <- metaMDS(comm.num.DOD.2015, distance = "bray", trymax = 2000, autotransform = F)
otu.nms_1_2015
otu.nms_2_2015 <- otu_rel_DOD_2015[ ,1:1]
View(otu.nms_2_2015)
MDS1.2015 = otu.nms_1_2015$points[,1]
MDS1.2015
MDS2.2015 = otu.nms_1_2015$points[,2]
MDS2.2015
NMDS = data.frame(MDS1 = MDS1.2015, MDS2 = MDS2.2015, Treatment = otu_rel_DOD_2015$Type)
library(ggplot2)


plot.2015 <- qplot(MDS1.2015, MDS2.2015, data=NMDS, main = "2015 Garlic Mustard", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
plot.2015 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD <- plot + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
  stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))


DOD
jpeg("DOD2015.jpeg",height=6,width=10,units = 'in', res = 600)#height in inches, resolution 600 dpi
plot(DOD)
dev.off()

































### Oak reciprocal ####

otu_rel_DOD_oak <- read.csv("oak_reciprocal_transplant_by type.csv", header = T, sep = ",")
View(otu_rel_DOD_oak)
dim(otu_rel_DOD_oak) ####27, 3446
comm.num.DOD.oak <- otu_rel_DOD_oak[ ,2:3446]
View(comm.num.DOD.oak)
set.seed(200)
library(vegan)
otu.nms_1_oak <- metaMDS(comm.num.DOD.oak, distance = "bray", trymax = 2000, autotransform = F)
otu.nms_1_oak
otu.nms_2_oak <- otu_rel_DOD_oak[ ,1:1]
View(otu.nms_2_oak)
MDS1_oak = otu.nms_1_oak$points[,1]
MDS1_oak
MDS2_oak = otu.nms_1_oak$points[,2]
MDS2_oak
NMDS = data.frame(MDS1 = MDS1_oak, MDS2 = MDS2_oak, Treatment = otu_rel_DOD_oak$Type)
library(ggplot2)


plot_oak <- qplot(MDS1_oak, MDS2_oak, data=NMDS, main = "Oak Reciprocal Transplant", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
plot_oak 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD <- plot + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
  #stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))


Plot
jpeg("oak.jpeg",height=6,width=10,units = 'in', res = 600)#height in inches, resolution 600 dpi
plot(plot)
dev.off()

### 2018 ####
otu_rel_DOD_2018 <- read.csv("2018_GM_by_treatment.csv", header = T, sep = ",")
View(otu_rel_DOD_2018)
dim(otu_rel_DOD_2018) ####20, 4367
comm.num.DOD.2018 <- otu_rel_DOD_2018[ ,2:4367]
View(comm.num.DOD.2018)
set.seed(200)
library(vegan)
otu.nms_1_2018 <- metaMDS(comm.num.DOD.2018, distance = "bray", trymax = 2000, autotransform = F)
otu.nms_1_2018
otu.nms_2_2018 <- otu_rel_DOD_2018[ ,1:1]
View(otu.nms_2_2018)
MDS1_2018 = otu.nms_1_2018$points[,1]
MDS1_2018
MDS2_2018 = otu.nms_1_2018$points[,2]
MDS2_2018
NMDS = data.frame(MDS1 = MDS1_2018, MDS2 = MDS2_2018, Treatment = otu_rel_DOD_2018$Type)
library(ggplot2)


plot_2018 <- qplot(MDS1_2018, MDS2_2018, data=NMDS, main = "2018 GM Synthesis", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
plot_2018 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD.2018 <- plot_2018 + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
  stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))


DOD.2018
jpeg("2018GM.jpeg",height=6,width=10,units = 'in', res = 600)#height in inches, resolution 600 dpi
plot(DOD)
dev.off()
# #### attempt #2 #####
# 
# otu_rel_DOD <- read.csv("DOD2017_combined_by_type.csv", header = T, sep = ",")
# View(otu_rel_DOD)
# dim(otu_rel_DOD) ####132, 1877
# comm.num.DOD <- otu_rel_DOD[ ,2:1877]
# View(comm.num.DOD)
# set.seed(200)
# library(vegan)
# otu.nms_1 <- metaMDS(comm.num.DOD, distance = "bray", trymax = 2000, autotransform = F)
# otu.nms_1
# otu.nms_2 <- otu_rel_DOD[ ,1:1]
# View(otu.nms_2)
# MDS1 = otu.nms_1$points[,1]
# MDS1
# MDS2 = otu.nms_1$points[,2]
# MDS2
# NMDS = data.frame(MDS1 = MDS1, MDS2 = MDS2, treatment = otu_rel_DOD$Type)
# library(ggplot2)
# 
# colors =c(rep("red", 45), rep("blue", 42), rep("yellow", 45))
# 
# ordiplot(NMDS, choices = c(MDS1, MDS2), type="points")





#### attempt #3 w/ hull ####

# loc = na.omit(NMDS) %>%
#   group_by(Treatment) %>%
#   mutate(hull = 1:n(), hull = factor(hull, chull(MDS1, MDS2))) %>%
#   arrange(hull)
# 
# ggplot(loc, aes(MDS1, MDS2, color = Treatment, fill = Treatment)) +
#   geom_polygon(data = filter(loc, !is.na(hull)), alpha = 0.5) +
#   geom_point() +
#   guides(color = FALSE, fill = FALSE) +
#   theme_bw() +
#   theme(axis.text = element_blank())






#### PDF Together ####


pdf("NMDS Plots.pdf") 
# This tells the graphic device (a.k.a., plotting area) in R that we want to save the plot as a pdf.

#2017
NMDS = data.frame(MDS1 = MDS1.2017, MDS2 = MDS2.2017, Treatment = otu_rel_DOD_2017$Type)
library(ggplot2)


# plot.2017 <- qplot(MDS1.2017, MDS2.2017, data=NMDS, main = "2017 Garlic Mustard", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
# plot.2017 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD.2017 <- plot.2017 + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
  stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))
DOD.2017

#2015
NMDS = data.frame(MDS1 = MDS1.2015, MDS2 = MDS2.2015, Treatment = otu_rel_DOD_2015$Type)
library(ggplot2)

# 
# plot.2015 <- qplot(MDS1.2015, MDS2.2015, data=NMDS, main = "2015 Garlic Mustard", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
# plot.2015 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD.2015 <- plot.2015 + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
  stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))


DOD.2015

#oak
NMDS = data.frame(MDS1 = MDS1_oak, MDS2 = MDS2_oak, Treatment = otu_rel_DOD_oak$Type)
library(ggplot2)

# 
# plot_oak <- qplot(MDS1_oak, MDS2_oak, data=NMDS, main = "Oak Reciprocal Transplant", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
# plot_oak 


#2018
NMDS = data.frame(MDS1 = MDS1_2018, MDS2 = MDS2_2018, Treatment = otu_rel_DOD_2018$Type)
library(ggplot2)

# 
# plot_2018 <- qplot(MDS1_2018, MDS2_2018, data=NMDS, main = "2018 GM Synthesis", color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
# plot_2018 


library(RColorBrewer)

cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")


DOD.2018 <- plot_2018 + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1),
        title = element_text(color = 'black')) +
  stat_ellipse(size=1.5)+
  scale_color_manual(values = cbbPalette) +
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))


DOD.2018

# Here is our code for the plot.  
dev.off()
