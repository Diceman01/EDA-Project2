library(dplyr)
library(tidyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

q1 <- NEI[NEI$year == "1999"|NEI$year == "2002"|NEI$year == "2005"|NEI$year == "2008",]

q2 <- q1[q1$fips == "24510",]
q2_byyear <- group_by(q2,year)
q2_ans <- summarize(q2_byyear,total_pm = sum(Emissions))

png("plot2.png")
barplot(q2_ans$total_pm, names.arg = q2_ans$year, main = "Total Emissions in Baltimore")
dev.off()