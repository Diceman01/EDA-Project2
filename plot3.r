library(dplyr)
library(tidyr)
library(ggplot2)

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

q3_bygroups <- group_by(NEI,year,type)
q3_ans <- summarize(q3_bygroups,total_pm = sum(Emissions))

#png("plot3.png")
qplot(year,total_pm,data = q3_ans,facets = .~type)
ggsave("plot3.png")
#dev.off()