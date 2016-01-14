setwd("F:/JHU/3_EXPLORATORY DATA/ASSIGNMENT 2")
NEI <- readRDS("summarySCC_PM25.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

agYF <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
agYF$fips[agYF$fips=="24510"] <- "Baltimore"
agYF$fips[agYF$fips=="06037"] <- "LA"
head(agYF)
## year      fips Emissions
##1 1999        LA 3931.1200
##2 2002        LA 4273.7102
##3 2005        LA 4601.4149
##4 2008        LA 4101.3210
##5 1999 Baltimore  346.8200
##6 2002 Baltimore  134.308

library(ggplot2)
png("plot6.png", width=680, height=480)
g <- ggplot(agYF, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab("Total PM2.5 Emissions") +
        ggtitle("Total Emissions from motorvehicle in Baltimore and in LA")
g
dev.off()