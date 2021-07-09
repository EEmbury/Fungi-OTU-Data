#https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/03--parsing.html

#clear environment
rm(list = ls())


library(readr) # Loads the readr package so we can use `read_tsv`


otu_data <- read_csv("DOD2017_basic.csv") # You might need to change the path to the file
print(otu_data) # You can also enter just `otu_data` to print it


otu_data$`OTUID` <- sub(otu_data$OTUID, 
                         pattern = "OTU", replacement = "")
print(otu_data) 

tail(colnames(otu_data), n = 10)
head(otu_data$Taxonomy, 10)

install.packages("taxa")
library(taxa)
obj <- parse_tax_data(otu_data,
                      class_cols = "Taxonomy", # The column in the input table
                      class_sep = ";") # What each taxon is seperated by
print(obj)

print(obj$data$tax_data)


obj <- parse_tax_data(otu_data,
                      class_cols = "Taxonomy",
                      class_sep = ";",
                      class_regex = "^([a-z]{0,1})_{0,2}(.*)$",
                      class_key = c("tax_rank" = "taxon_rank", "name" = "taxon_name"))
print(obj)

head(taxon_names(obj)

obj$data$class_data

head(taxon_ranks(obj))

obj$data$class_data <- NULL

names(obj$data) <- "otu_counts"
print(obj)
     