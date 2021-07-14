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

###DOD 2017 ####
#read data
otudata <- read.csv("DOD2015_data.csv")
otutax <- read.csv("DOD2015_taxa.csv")
samdata <- read.csv("DOD2015_metadata.csv")

#coerce matrix

test <- as.matrix(otu_taxa, rownames.force = NA)

#change row labels

otudata$OTUid <- sub(otudata$OTUid, 
                        pattern = "OTU_", replacement = "")

library(tidyverse)
otu_data <- otudata %>% remove_rownames %>% column_to_rownames(var="OTUid")


otutax$OTUid <- sub(otutax$OTUid, 
                  pattern = "OTU", replacement = "")

otu_taxa <- otutax %>% remove_rownames %>% column_to_rownames(var="OTUid")





# Taxa reorganizaion


 library(tidyr)
y <- otu_taxa %>% separate(Taxonomy, c("domain", "phylum", "class", "order", "family", "genus"), "[][a-z ];")



y$domain <- sub(y$domain,  pattern = "k_", replacement = "")


y$phylum <- sub(y$phylum, 
                pattern = "p__", replacement = "")
 
 y$class <- sub(y$class, 
                 pattern = "c__", replacement = "")

 y$order <- sub(y$order,
                pattern = "o__", replacement = "")

y$family <- sub(y$family,
               pattern = "f__", replacement = "")
 y$genus <- sub(y$genus,
                pattern = "g__", replacement = "")

write.csv(y,"DOD2015_seperate_taxa.csv", row.names = FALSE)


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


p <- plot_richness(physeq1, x="SampleType", color="SampleType", measures=c("Shannon", "Simpson", "InvSimpson"))
p + geom_point(size=1, alpha=0.05)
