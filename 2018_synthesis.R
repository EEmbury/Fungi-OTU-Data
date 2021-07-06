data <- read_csv("data.csv")

#Calculate alpha + add new column
data$alpha <- diversity(data,
                                     MARGIN = 1,
                                     index = "shannon")

write.csv(data,"name.csv", row.names = FALSE)
