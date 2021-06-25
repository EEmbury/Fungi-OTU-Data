#clear environment
rm(list = ls())

#import data
test <- read.csv("Guild_output.csv")

#load package
library(otuSummary)
library(cluster.datasets)


#source: https://cran.r-project.org/web/packages/otuSummary/otuSummary.pdf 


data(test)

summaryInfo <- otuReport(otutab = test, siteInCol = TRUE, taxhead = "taxonomy",
                         platform = "qiime", pattern = ";", prefix = TRUE, percent = FALSE, taxlevel = "class")
length(summaryInfo)
names(summaryInfo)


per <- subOTU(otutab = test, siteInCol = TRUE, taxhead = "taxonomy",
              percent = FALSE, choose = "all", outype = "Relabund", sort = TRUE)


summaryInfo <- otuReport(otutab = per, siteInCol = TRUE, taxhead = "taxonomy",
                         platform = "qiime", pattern = ";", percent = TRUE, taxlevel = "class")
pbray
length(summaryInfo)
names(summaryInfo)



#sort taxanomic level?