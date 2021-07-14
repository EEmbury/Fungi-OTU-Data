library(phyloseq)
library(ggplot2)

#read data
otudata <- read.csv("DOD2017_otu_matix.csv")
otutax <- read.csv("DOD2017_seperate_taxa.csv")

test <- as.matrix(otu_taxa, rownames.force = NA)

#change row labels

otudata$`OUT_ID` <- sub(otudata$OUT_ID, 
                         pattern = "OTU", replacement = "")

library(tidyverse)
otu_data <- otudata %>% remove_rownames %>% column_to_rownames(var="OUT_ID")


otutax$OTU <- sub(otutax$OTU, 
                        pattern = "OTU", replacement = "")

otu_taxa <- otutax %>% remove_rownames %>% column_to_rownames(var="OTU")

library(phyloseq)
OTU <- otu_table(otu_data, taxa_are_rows = TRUE)
TAX <-  tax_table(test)
OTU
TAX

physeq = phyloseq(OTU, TAX)





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
