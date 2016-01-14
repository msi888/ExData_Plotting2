## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
setwd("F:/JHU/3_EXPLORATORY DATA/ASSIGNMENT 2")
NEI <- readRDS("summarySCC_PM25.rds")
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
y <- aggregate(Emissions ~ year, subsetNEI, sum)
head(y)
## year Emissions
##1 1999 346.82000
##2 2002 134.30882
##3 2005 130.43038
##4 2008  88.27546
library(ggplot2)
png("plot5.png", width=680, height=480)
g <- ggplot(y, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab("Total PM2.5 Emissions") +
        ggtitle("Total Emissions in Baltimore from motorvehicles")
g
dev.off()