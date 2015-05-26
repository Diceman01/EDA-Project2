library(dplyr)
library(tidyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

q1 <- NEI[NEI$year == "1999"|NEI$year == "2002"|NEI$year == "2005"|NEI$year == "2008",]
q1_byyear <- group_by(q1,year)
q1_ans <- summarize(q1_byyear,total_pm = sum(Emissions))

png("plot1.png")
barplot(q1_ans$total_pm, names.arg = q1_ans$year, main = "Total Emissions across US")
dev.off()