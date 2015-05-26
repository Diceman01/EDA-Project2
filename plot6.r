library(dplyr)
library(tidyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

q5 <- inner_join(NEI,SCC[grep("Onroad",SCC$Data.Category),], by = "SCC")
q5_balt <- q5[q5$fips == "24510",]
q5_ans <- summarize(group_by(q5_balt,year),total_emissions = sum(Emissions))

q6 <- q5[q5$fips == "06037",]
q6_byyear <- summarize(group_by(q6,year),total_emissions = sum(Emissions))
q6_ans <- data.frame(cbind(q5_ans$year,q5_ans$total_emissions,q6_byyear$total_emissions))
names(q6_ans) <- c("year","Baltimore","Los Angeles")

png("plot6.png")
barplot(as.matrix(q6_ans[,3:2]), beside = TRUE, legend.text = q6_ans$year)
dev.off()