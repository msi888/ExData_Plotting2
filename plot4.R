## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
setwd("F:/JHU/3_EXPLORATORY DATA/ASSIGNMENT 2")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(SCC)
summary(SCC$EI.Sector)
coal <- grepl("Coal", SCC$EI.Sector)
coalsources <- SCC[coal,]
head(coalsources)
# Locate emissions from coal sources and group by year
e <- NEI[(NEI$SCC %in% coalsources$SCC), ]
ey <- aggregate(Emissions ~ year, data=e, FUN=sum)
ey
## year Emissions
##1 1999  572126.5
##2 2002  546789.2
##3 2005  552881.5
##4 2008  343432.2
library(ggplot2)
png("plot4.png")
ggplot(ey, aes(x=factor(year), y=Emissions)) +
        geom_bar(stat="identity") +
        xlab("year") +
        ylab("total PM2.5 emissions") +
        ggtitle("Emissions from coal sources")
dev.off()