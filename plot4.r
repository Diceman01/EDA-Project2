library(dplyr)
library(tidyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

cd <- SCC[grep("Coal",SCC$Short.Name),]
ccd <- cd[grep("Comb",cd$Short.Name),]
q4 <- inner_join(NEI,ccd, by = "SCC")
q4_ans <- summarize(group_by(q4,year),total_emissions = sum(Emissions))

png("plot4.png")
barplot(q4_ans$total_emissions, names.arg = q4_ans$year, las = 1, main = "Coal-combustion related emissions for US")
dev.off()