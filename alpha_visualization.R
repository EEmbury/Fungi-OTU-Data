library(phyloseq)
library(ggplot2)

otudata <- read.csv("DOD2017_otu_matix.csv")
otutax <- read.csv("DOD2017_taxa.csv")


otudata$`OUT_ID` <- sub(otudata$OUT_ID, 
                         pattern = "OTU", replacement = "")

library(tidyverse)
otu_data <- otudata %>% remove_rownames %>% column_to_rownames(var="OUT_ID")

library(phyloseq)
OTU <- otu_table(otu_data, taxa_are_rows = TRUE)
TAX <-  tax_table(otutax)
OTU
TAX


library(taxa)
taxa <- parse_tax_data(otutax,
                       class_cols = "Taxonomy", # The column in the input table
                      class_sep = ";") # What each taxon is seperated by
print(taxa)


physeq = phyloseq(OTU, TAX)

library(tidyr)
y <- otutax %>% separate(Taxonomy, c("domain", "phylum", "class", "order", "family", "genus"), "[]_[a-z];")
