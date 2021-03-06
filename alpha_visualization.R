# https://joey711.github.io/phyloseq/import-data.html#_microbio_me_qiime_(defunct)

library(phyloseq)
library(ggplot2)
library(vegan)

###DOD 2017 ####
#read data
otudata <- read.csv("DOD2017_otu_matix.csv")
otutax <- read.csv("DOD2017_seperate_taxa.csv")
samdata <- read.csv("DOD2017_metadata.csv")

#coerce matrix

test <- as.matrix(otu_taxa, rownames.force = NA)

#change row labels

otudata$`OUT_ID` <- sub(otudata$OUT_ID, 
                         pattern = "OTU", replacement = "")

library(tidyverse)
otu_data <- otudata %>% remove_rownames %>% column_to_rownames(var="OUT_ID")


otutax$OTU <- sub(otutax$OTU, 
                        pattern = "OTU", replacement = "")

otu_taxa <- otutax %>% remove_rownames %>% column_to_rownames(var="OTU")

# setting data to phyloseq format

library(phyloseq)
OTU <- otu_table(otu_data, taxa_are_rows = TRUE)
TAX <-  tax_table(test)
SAM <- sample_data(samdata)
OTU
TAX
SAM

DOD2017 <- phyloseq(OTU, TAX)

#mystery answer to error in validobject

rownames(samdata) <-samdata$SampleID


physeq1 <- merge_phyloseq(DOD2017, SAM)


#setting up ggplot themes

theme_set(theme_bw())
pal = "Set1"
scale_colour_discrete <-  function(palname=pal, ...){
  scale_colour_brewer(palette=palname, ...)
}
scale_fill_discrete <-  function(palname=pal, ...){
  scale_fill_brewer(palette=palname, ...)
}

#fix the random column

df = subset(otu_data, select = -c(X) )


#Plotting

p <- plot_richness(physeq1, x="SampleType", color="SampleType", measures=c("Shannon", "Simpson", "InvSimpson"))
p + geom_point(size=1, alpha=0.05)


# Taxa reorganizaion
# library(taxa)
# taxa <- parse_tax_data(otutax,
# #                        class_cols = "Taxonomy", # The column in the input table
# #                       class_sep = ";") # What each taxon is seperated by
# print(taxa)
# 

# library(tidyr)
# y <- otutax %>% separate(Taxonomy, c("domain", "phylum", "class", "order", "family", "genus"), "[][a-z ];")
# 
# y$domain <- sub(y$domain, 
#                         pattern = "d__", replacement = "")
# 
# y$phylum <- sub(y$phylum, 
#                 pattern = "p__", replacement = "")
# 
# y$class <- sub(y$class, 
#                 pattern = "c__", replacement = "")
# 
# y$order <- sub(y$order, 
#                pattern = "o__", replacement = "")
# 
# y$family <- sub(y$family, 
#                pattern = "f__", replacement = "")
# 
# y$genus <- sub(y$genus, 
#                pattern = "g__", replacement = "")
# 
# write.csv(y,"DOD2017_seperate_taxa.csv", row.names = FALSE)




#### DOD 2015 ####


library(phyloseq)
library(ggplot2)

#read data
otudata <- read.csv("DOD2015_data.csv")
otutaxa <- read.csv("DOD2015_taxa.csv")
samdata <- read.csv("DOD2015_metadata.csv")


#change row names in taxa data to plot iD

rownames(samdata) <-samdata$SampleID


#change row labels --- removes "otu" and changes first column to row labels
library(tidyverse)

otudata$OTUid <- sub(otudata$OTUid, 
                        pattern = "OTU_", replacement = "")


otu_data <- otudata %>% remove_rownames %>% column_to_rownames(var="OTUid")


otutaxa$OTUid <- sub(otutaxa$OTUid, 
                  pattern = "OTU_", replacement = "")

otu_taxa <- otutaxa %>% remove_rownames %>% column_to_rownames(var="OTUid")



#coerce matrix --- taxa needs to be matrix

test <- as.matrix(otu_taxa, rownames.force = NA)



# Taxa reorganizaion


#   library(tidyr)
#  y <- otu_taxa %>% separate(Taxonomy, c("domain", "phylum", "class", "order", "family", "genus"), "[][a-z ];")
#  
# # 
#  
# y$domain <- sub(y$domain,  pattern = "k_", replacement = "")
#  
# # 
# y$phylum <- sub(y$phylum, 
#                  pattern = "p__", replacement = "")
#   
#   y$class <- sub(y$class, 
#                  pattern = "c__", replacement = "")
# # 
#  y$order <- sub(y$order,
#                 pattern = "o__", replacement = "")
# # 
# y$family <- sub(y$family,
#                pattern = "f__", replacement = "")
#   y$genus <- sub(y$genus,
#                  pattern = "g__", replacement = "")
#  
#  write.csv(y,"DOD2015_seperate_taxa_3.csv", row.names = FALSE)




# setting data to phyloseq format

library(phyloseq)
OTU <- otu_table(otu_data, taxa_are_rows = TRUE)
TAX <-  tax_table(test)
SAM <- sample_data(samdata)
OTU
TAX
SAM

DOD2017 <- phyloseq(OTU, TAX) #combines taxa and data into readable format


physeq1 <- merge_phyloseq(DOD2017, SAM) #adds sample metadata to readable format





#setting up ggplot themes

theme_set(theme_bw())
pal = "Set1"
scale_colour_discrete <-  function(palname=pal, ...){
  scale_colour_brewer(palette=palname, ...)
}
scale_fill_discrete <-  function(palname=pal, ...){
  scale_fill_brewer(palette=palname, ...)
}

#ggplot

p <- plot_richness(physeq1, x="SampleType", color="SampleType", measures=c("Shannon", "Simpson", "InvSimpson"))
p + geom_point(size=1, alpha=0.05)




#### Taxa Reorganization ####

hemlock.taxa <- read.csv("hemlock_taxa.csv")

library(tidyr)
y <- hemlock.taxa %>% separate(taxonomy, c("kingdom", "phylum", "class", "order", "family", "genus"), "[][a-z ];")

y$kingdom <- sub(y$kingdom,  pattern = "_", replacement = "")
 
y$phylum <- sub(y$phylum, pattern = "p__", replacement = "")
   
y$class <- sub(y$class, pattern = "c__", replacement = "")

y$order <- sub(y$order, pattern = "o__", replacement = "")

y$family <- sub(y$family, pattern = "f__", replacement = "")

y$genus <- sub(y$genus,  pattern = "g__", replacement = "")
  

write.csv(y,"hemlock_seperate_taxa.csv", row.names = FALSE)
 
 
#### All data ####

library(phyloseq)
library(ggplot2)

#read data
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
samdata.2018 <- read.csv('2018_metadata_2.csv')

otudata.hemlock <- read.csv("hemlock_data.csv")
otutaxa.hemlock <- read.csv("hemlock_seperate_taxa.csv")
samdata.hemlock <- read.csv("hemlock_metadata.csv")

# samdata.2018.GM <- read.csv('2018_metadata_GM.csv')
# samdata.2018.N <- read.csv('2018_metadata_N.csv')
# samdata.2018.heat <- read.csv('2018_metadata_heat.csv')

#change row names in taxa data to plot iD

rownames(samdata.2015) <-samdata.2015$SampleID
rownames(samdata.2017) <-samdata.2017$SampleID

rownames(samdata.oak) <-samdata.oak$SampleID

rownames(samdata.2018) <-samdata.2018$SampleID

rownames(samdata.hemlock) <-samdata.hemlock$sample

# rownames(samdata.2018.GM) <-samdata.2018.GM$SampleID
# rownames(samdata.2018.N) <-samdata.2018.N$SampleID
# rownames(samdata.2018.heat) <-samdata.2018.heat$SampleID

#change row labels --- removes "otu" and changes first column to row labels

library(tidyverse)

otudata.2015$OTUiD <- sub(otudata.2015$OTUiD, 
                     pattern = "OTU_", replacement = "")


otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="OTUiD")


otudata.2017$OTUID <- sub(otudata.2017$OTUID, 
                          pattern = "OTU", replacement = "")


otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OTUID")




otu_taxa.2015 <- otutax.2015 %>% remove_rownames %>% column_to_rownames(var="OTUid")



otutax.2017$OTU <- sub(otutax.2017$OTU, 
                    pattern = "OTU", replacement = "")

otu_taxa.2017 <- otutax.2017 %>% remove_rownames %>% column_to_rownames(var="OTU")


otu_data.oak <- otudata.oak %>% remove_rownames %>% column_to_rownames(var="OTU.ID")

otu_taxa.oak <- otutaxa.oak %>% remove_rownames %>% column_to_rownames(var="OTU.ID")


otudata.2018$OTUID <- sub(otudata.2018$OTUID, 
                        pattern = "Otu", replacement = "")


otu_data.2018 <- otudata.2018 %>% remove_rownames %>% column_to_rownames(var="OTUID")

otutaxa.2018$OTU.ID <- sub(otutaxa.2018$OTU.ID, 
                       pattern = "Otu", replacement = "")

otu_taxa.2018 <- otutaxa.2018 %>% remove_rownames %>% column_to_rownames(var="OTU.ID")






otu_data.hemlock <- otudata.hemlock %>% remove_rownames %>% column_to_rownames(var="Otu.ID")
otu_taxa.hemlock<- otutaxa.hemlock %>% remove_rownames %>% column_to_rownames(var="Otu.ID")




#coerce matrix --- taxa needs to be matrix

taxa.2015 <- as.matrix(otu_taxa.2015, rownames.force = NA)

taxa.2017 <- as.matrix(otu_taxa.2017, rownames.force = NA)

taxa.oak <- as.matrix(otu_taxa.oak, rownames.force = NA)

taxa.2018 <- as.matrix(otu_taxa.2018, rownames.force = NA)

taxa.hemlock <- as.matrix(otu_taxa.hemlock, rownames.force = NA)

# setting data to phyloseq format

library(phyloseq)

OTU.2015 <- otu_table(otu_data.2015, taxa_are_rows = TRUE)
TAX.2015 <-  tax_table(taxa.2015)
SAM.2015 <- sample_data(samdata.2015,  na.exclude(samdata.2015))

OTU.2017 <- otu_table(otu_data.2017, taxa_are_rows = TRUE)
TAX.2017 <-  tax_table(taxa.2017)
SAM.2017 <- sample_data(samdata.2017)

OTU.oak <- otu_table(otu_data.oak, taxa_are_rows = TRUE)
TAX.oak <-  tax_table(taxa.oak)
SAM.oak <- sample_data(samdata.oak)

OTU.2018 <- otu_table(otu_data.2018, taxa_are_rows = TRUE)
TAX.2018 <-  tax_table(taxa.2018)
SAM.2018 <- sample_data(samdata.2018)

OTU.hemlock <-  otu_table(otu_data.hemlock, taxa_are_rows = TRUE)
Tax.hemlock <- tax_table(taxa.hemlock)
SAM.hemlock <- sample_data(samdata.hemlock)

# SAM.2018.GM <- sample_data(samdata.2018.GM)
# SAM.2018.N <- sample_data(samdata.2018.N)
# SAM.2018.heat <- sample_data(samdata.2018.heat)

hemlock <- phyloseq(OTU.hemlock, Tax.hemlock)
hemlock.2 <- merge_phyloseq(hemlock, SAM.hemlock)
Phylo2018 <- phyloseq(OTU.2018, TAX.2018)
oak <- phyloseq(OTU.oak, TAX.oak)
DOD2015 <- phyloseq(OTU.2015, TAX.2015)
DOD2017 <- phyloseq(OTU.2017, TAX.2017)#combines taxa and data into readable format

physeq2018 <- merge_phyloseq(Phylo2018, SAM.2018)

physeq2017 <- merge_phyloseq(DOD2017, SAM.2017)#adds sample metadata to readable format

physeq2015 <- merge_phyloseq(DOD2015, SAM.2015)

physeqoak <- merge_phyloseq(oak, SAM.oak)

physeqDOD <- merge_phyloseq(physeq2015, physeq2017)

combined <- merge_phyloseq(physeqDOD, physeqoak)

alldata.1 <- merge_phyloseq(combined, physeq2018)

#alldata.2 <- merge_phyloseq(alldata.1, hemlock.2)


#### plot alpha w/ box plot ####

 
vignette("phyloseq-basics")
vignette("phyloseq-analysis")


alpha_meas = c("Shannon")

p <- plot_richness(alldata.4, x="Grouped", measures=alpha_meas, color = "Grouped")+
  labs(title = "Alpha Diversity Measurment by Treatment" , caption = "P-value = 0.24547348")

p

p + geom_boxplot(data = p$data, aes(x=Grouped, y=value, color = NULL), alpha=0.05) +
  xlab("Treatment") +
  theme(panel.grid = element_blank(),
        legend.position = "none",
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid"))



otuall.t$Alpha <- diversity(otuall.t,
                          MARGIN = 1,
                          index = "shannon")

otu_year_group <- read.csv("otu_alpha_2.csv")

mixed_alpha <- aov(Alpha ~ Grouped*Year, data = otu_year_group)
mixed_alpha

TukeyHSD(mixed_alpha)

write.csv(otuall.t, "otu_alpha_2.csv", row.names =TRUE)



###### Beta visualization #####

#write.csv(alldata.1@otu_table,"all_otu.3.csv", row.names = FALSE)



all.NMDS <- ordinate(alldata.1, "NMDS", "bray")

# with hemlock
#all.NMDS.2 <- ordinate(alldata.2, "NMDS", "bray")


#### remove NA #### by treatment

samall <- read.csv("all_sam.csv")
rownames(samall) <- samall$SampleID

rownames(otuall.t) <- colnames(otuall)
colnames(otuall.t) <- rownames(otuall)

otuall <- read.csv("all_otu.3.csv")

library(data.table)
otuall.t <- transpose(otuall)

allsam <- sample_data(samall)

allotu <- otu_table(otuall, taxa_are_rows = TRUE)

alldata.4 <- merge_phyloseq(allotu, allsam)

all.NMDS.4 <- ordinate(alldata.4, "NMDS", "bray")

#### remove NA #### veg, site, year
all_sample <- read.csv('alldata_sample.csv')
rownames(all_sample) <-all_sample$SampleID

all_data_otu <- read.csv("alldata_otu.csv")

all.sam <- sample_data(all_sample)

all.otu <- otu_table(all_data_otu, taxa_are_rows = TRUE)

alldata.3 <- merge_phyloseq(all.otu, all.sam)

all.NMDS.3 <- ordinate(alldata.3, "NMDS", "bray")



cbbPalette <- c("#009E73", "#e79f00", "#0072B2", "#D55E00", "#CC79A7", "#9999CC")



p.treatment <- plot_ordination(alldata.4, all.NMDS.4, color="Grouped")

p.treatment + geom_point(size= 2)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid")) +
   labs(title = "By Treatment", caption = "Stress = 0.2301558; P-value = 0.001")



p.simplified <- plot_ordination(alldata.1, all.NMDS, color="simple")

p.simplified + geom_point(size= 2)+
  stat_ellipse(size =2) +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid")) +
  labs(title = "Treatment vs. Control Across Studies", caption = "Stress = 0.2431589; P-value = 0.694")



p.vegetation <- plot_ordination(alldata.3, all.NMDS.3, color="Vegetation")

p.vegetation + geom_point(size= 2, na.rm = TRUE)+
  stat_ellipse(size =2) + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid")) +
  labs(title = "Vegetation of Controls Across Studies", caption = "Stress = 0.2420825; P-value = 0.001") 



p.site <- plot_ordination(alldata.3, all.NMDS.3, color="Site")

p.site + geom_point(size= 2, na.rm = TRUE)+
  stat_ellipse(size =2) + 
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid")) +
  labs(title = "Study Studies", caption = "Stress = 0.2420825; P-value = 0.064") 



p.year <- plot_ordination(alldata.3, all.NMDS.3, color= "Year")

p.year + geom_point(size= 2)+
  stat_ellipse(size =2)  +
  theme(panel.grid = element_blank(),
        panel.background = element_rect(fill = "white"),
        panel.border = element_rect(color = "black", fill = NA, size = 0.5),
        plot.title = element_text(hjust = 0.5),
        plot.caption = element_text(hjust = 0),
        axis.title.x = element_text(color="black", vjust=1),
        axis.title.y = element_text(color="black" , vjust=1))+
  theme(strip.background = element_rect(colour="black", fill="white",
                                        size=0.5, linetype="solid")) +
  labs(title = "Study Years", caption = "Stress = 0.2420825; P-value = 0.001") 


#### ANOVA #####
#http://deneflab.github.io/MicrobeMiseq/demos/mothur_2_phyloseq.html#permanova

bray.1 <- phyloseq::distance(alldata.1, method = "bray")
bray.3 <- phyloseq::distance(alldata.3, method = "bray")
bray.4 <- phyloseq::distance(alldata.4, method = "bray")


sampledf.1 <- data.frame(sample_data(alldata.1))
sampledf.3 <- data.frame(sample_data(alldata.3))
sampledf.4 <- data.frame(sample_data(alldata.4))


beta.simple <- betadisper(bray.1, sampledf.1$simple)
simple.anova <- permutest(beta.simple)

beta.year <- betadisper(bray.3, sampledf.3$Year)
year.anova <- permutest(beta.year, pairwise = TRUE)

year.anova

beta.veg <- betadisper(bray.3, sampledf.3$Vegetation)
veg.anova <- permutest(beta.veg)

beta.site <- betadisper(bray.3, sampledf.3$Site)
site.anova <- permutest(beta.site)

beta.group <- betadisper(bray.4, sampledf.4$Grouped)
group.anova <- permutest(beta.group, pairwise = TRUE)






#### mixed effect model ####



if(!require(psych)){install.packages("psych")}
if(!require(lme4)){install.packages("lme4")}
if(!require(lmerTest)){install.packages("lmerTest")}
if(!require(multcompView)){install.packages("multcompView")}
if(!require(lsmeans)){install.packages("lsmeans")}
if(!require(nlme)){install.packages("nlme")}
if(!require(car)){install.packages("car")}
if(!require(rcompanion)){install.packages("rcompanion")}

Data = alldata.4@sam_data

Data.2 <- as.matrix(Data, rownames.force = NA)

###  Order factors by the order in data frame
###  Otherwise, R will alphabetize them

Data$Grouped = factor(Data$Grouped,
                        levels=unique(Data$Grouped))

Data$Year = factor(Data$Year,
                         levels=unique(Data$Year))

###  Check the data frame

library(psych)
headTail(Data)
str(Data)
summary(Data)   

### Remove unnecessary objects

rm(Input)

#In this first example, the model will be specified with the lmer function 
#in the package lme4.  The term (1|Town) in the model formula indicates that 
#Town should be treated as a random variable, with each level having its own 
#in the model.  The anova function in the package lmerTest is used to 
#produce p-values for the fixed effects.  The rand function in the package 
#lmerTest produces p-values for the random effects. 

library(lme4)
library(lmerTest)

model = lmer(alldata.4@sam_data ~ Grouped + (1|plot),
             data=NULL,
             REML=TRUE)


anova(model)
rand(model)

#posthoc analysis 

library(multcompView)
library(lsmeans)

marginal = lsmeans(model, 
                   ~ treatment)

CLD = cld(marginal,
          alpha=0.05, 
          Letters=letters,        ### Use lower-case letters for .group
          adjust="tukey")         ###  Tukey-adjusted comparisons

CLD

pairs(marginal,
      adjust="tukey")




                       