library(dplyr)
library(tidyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

q5 <- inner_join(NEI,SCC[grep("Onroad",SCC$Data.Category),], by = "SCC")
q5_balt <- q5[q5$fips == "24510",]
q5_ans <- summarize(group_by(q5_balt,year),total_emissions = sum(Emissions))

png("plot5.png")
barplot(q5_ans$total_emissions, names.arg = q5_ans$year, las = 1, main = "Vehicle related emissions for Baltimore")
dev.off()