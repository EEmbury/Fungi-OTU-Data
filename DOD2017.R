# code source: https://grunwaldlab.github.io/analysis_of_microbiome_community_data_in_r/07--diversity_stats.html

#load packages
library(vegan)
library(otuSummary)

#load samples
load("clean_data.Rdata")

# import data
DOD2017_invaded <- read.csv("DOD2017_invaded_byrow.csv")


#test code
sample_data$alpha <- diversity(obj$data$otu_rarefied[, sample_data$SampleID],
                               MARGIN = 2,
                               index = "invsimpson")
hist(sample_data$alpha)


#code with DOD data
DOD2017_invaded$alpha <- diversity(obj$data$otu_rarefied[, DOD2017_invaded$OTUID$Taxonomy],
                               MARGIN = 1,
                               index = "invsimpson")
hist(DOD2017_invaded$alpha)




