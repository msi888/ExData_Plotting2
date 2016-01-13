# Read files
setwd("F:/JHU/3_EXPLORATORY DATA/ASSIGNMENT 2")
NEI <- readRDS("summarySCC_PM25.rds")
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008?
te <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
str(te)
barplot(height=te$Emissions, names.arg=te$year,xlab="years", ylab='Tot. PM2.5 emissions',
        main="Tot. PM2.5 emissions per year", col="orange")
dev.off()