# https://joey711.github.io/phyloseq/import-data.html#_microbio_me_qiime_(defunct)

library(phyloseq)
library(ggplot2)

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


library(tidyr)
y <- otutaxa.2018 %>% separate(Taxonomy, c("domain", "phylum", "class", "order", "family", "genus"), "[][a-z ];")

y$domain <- sub(y$domain,  pattern = "d__", replacement = "")
 
y$phylum <- sub(y$phylum, pattern = "p__", replacement = "")
   
y$class <- sub(y$class, pattern = "c__", replacement = "")

y$order <- sub(y$order, pattern = "o__", replacement = "")

y$family <- sub(y$family, pattern = "f__", replacement = "")

y$genus <- sub(y$genus,  pattern = "g__", replacement = "")
  

write.csv(y,"2018_seperate_taxa_2.csv", row.names = FALSE)
 
 
#### DOD 2015 + 2017 ####

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
samdata.2018 <- read.csv('2018_metadata.csv')

#change row names in taxa data to plot iD

rownames(samdata.2015) <-samdata.2015$SampleID
rownames(samdata.2017) <-samdata.2017$SampleID

rownames(samdata.oak) <-samdata.oak$SampleID

rownames(samdata.2018) <-samdata.2018$SampleID

#change row labels --- removes "otu" and changes first column to row labels

library(tidyverse)

otudata.2015$OTUiD <- sub(otudata.2015$OTUiD, 
                     pattern = "OTU_", replacement = "")


otu_data.2015 <- otudata.2015 %>% remove_rownames %>% column_to_rownames(var="OTUiD")


otudata.2017$OUT_ID <- sub(otudata.2017$OUT_ID, 
                          pattern = "OTU", replacement = "")


otu_data.2017 <- otudata.2017 %>% remove_rownames %>% column_to_rownames(var="OUT_ID")




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


#coerce matrix --- taxa needs to be matrix

taxa.2015 <- as.matrix(otu_taxa.2015, rownames.force = NA)

taxa.2017 <- as.matrix(otu_taxa.2017, rownames.force = NA)

taxa.oak <- as.matrix(otu_taxa.oak, rownames.force = NA)

taxa.2018 <- as.matrix(otu_taxa.2018, rownames.force = NA)

# setting data to phyloseq format

library(phyloseq)

OTU.2015 <- otu_table(otu_data.2015, taxa_are_rows = TRUE)
TAX.2015 <-  tax_table(taxa.2015)
SAM.2015 <- sample_data(samdata.2015)

OTU.2017 <- otu_table(otu_data.2017, taxa_are_rows = TRUE)
TAX.2017 <-  tax_table(taxa.2017)
SAM.2017 <- sample_data(samdata.2017)

OTU.oak <- otu_table(otu_data.oak, taxa_are_rows = TRUE)
TAX.oak <-  tax_table(taxa.oak)
SAM.oak <- sample_data(samdata.oak)

OTU.2018 <- otu_table(otu_data.2018, taxa_are_rows = TRUE)
TAX.2018 <-  tax_table(taxa.2018)
SAM.2018 <- sample_data(samdata.2018)


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

alldata <- merge_phyloseq(combined, physeq2018)


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

p <- plot_richness(physeqDOD, x="Year", color="SampleType", measures=c("Simpson", "Shannon"))
p + geom_point(size=1, alpha=0.5)


#### attempt to plot ANOVA ####

 
vignette("phyloseq-basics")
vignette("phyloseq-analysis")


alpha_meas = c("Shannon")

p <- plot_richness(alldata, x="SampleType", measures=alpha_meas)

p

p + geom_boxplot(data=p$data, aes(x=SampleType, y=value), alpha=0.05) 

