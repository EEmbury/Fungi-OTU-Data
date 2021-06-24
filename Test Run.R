#clear environment
rm(list = ls())

#import data
potato <- read.csv("Guild_output.csv")

#load package
library(otuSummary)


# are these magic??? Will it be this simple????

# no - it will not be this simple

#source: https://cran.r-project.org/web/packages/otuSummary/otuSummary.pdf 


data()
summaryInfo <- otuReport(otutab = otuqiime, siteInCol = TRUE, taxhead = "taxonomy",
                         platform = "qiime", pattern = ";", prefix = TRUE, percent = FALSE, taxlevel = "class")
length(summaryInfo)
names(summaryInfo)


per <- subOTU(otutab = otuqiime, siteInCol = TRUE, taxhead = "taxonomy",
              percent = FALSE, choose = "all", outype = "Relabund", sort = TRUE)
summaryInfo <- otuReport(otutab = per, siteInCol = TRUE, taxhead = "taxonomy",
                         platform = "qiime", pattern = ";", percent = TRUE, taxlevel = "class")
14 pbray
length(summaryInfo)
names(summaryInfo)
