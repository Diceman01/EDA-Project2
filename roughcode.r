library(dplyr)
library(tidyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

cd <- SCC[grep("Coal",SCC$Short.Name),]
ccd <- cd[grep("Comb",cd$Short.Name),]
q4 <- inner_join(NEI,ccd, by = "SCC")
q4_ans <- summarize(group_by(q4,year),total_emissions = sum(Emissions))
barplot(q4_ans$total_emissions, names.arg = q4_ans$year, las = 1, main = "Coal-combustion related emissions for US")

q5 <- inner_join(NEI,SCC[grep("Onroad",SCC$Data.Category),], by = "SCC")
summarize(group_by(q5,year),total_emissions = sum(Emissions))
q5_balt <- q5["fips" == 24510,]
summarize(group_by(q5_balt,year),total_emissions = sum(Emissions))
q5_balt
