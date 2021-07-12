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



### Attempt #1 ####

otu_rel_DOD <- read.csv("DOD2017_combined_by_type.csv", header = T, sep = ",")
View(otu_rel_DOD)
dim(otu_rel_DOD) ####132, 1877
comm.num.DOD <- otu_rel_DOD[ ,2:1877]
View(comm.num.DOD)
set.seed(200)
library(vegan)
otu.nms_1 <- metaMDS(comm.num.DOD, distance = "bray", trymax = 2000, autotransform = F)
otu.nms_1
otu.nms_2 <- otu_rel_DOD[ ,1:1]
View(otu.nms_2)
MDS1 = otu.nms_1$points[,1]
MDS1
MDS2 = otu.nms_1$points[,2]
MDS2
NMDS = data.frame(MDS1 = MDS1, MDS2 = MDS2, Treatment = otu_rel_DOD$Type)
library(ggplot2)


plot <- qplot(MDS1, MDS2, data=NMDS, color=Treatment, alpha=0.5, size = 1) + guides(size = "none") + guides(alpha = 'none')
plot 


ggplot(mds_data_invaded, aes(x = MDS1, y = MDS2)) +
  ggtitle("Invaded")+
  geom_point(color='orangered1')



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


DOD
jpeg("DOD2017.jpeg",height=6,width=10,units = 'in', res = 600)#height in inches, resolution 600 dpi
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

