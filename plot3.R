## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
##Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
##answer this question.

setwd("F:/JHU/3_EXPLORATORY DATA/ASSIGNMENT 2")
NEI <- readRDS("summarySCC_PM25.rds")
be <- NEI[NEI$fips=="24510",]
beaggr <- aggregate(Emissions ~ year + type,data=be,FUN=sum)
str(beaggr)
## data.frame':        16 obs. of  3 variables:
## $ year     : int  1999 2002 2005 2008 1999 2002 2005 2008 1999 2002 ...
## $ type     : chr  "NON-ROAD" "NON-ROAD" "NON-ROAD" "NON-ROAD" ...
## $ Emissions: num  522.9 240.8 248.9 55.8 2107.6 ...

library(ggplot2)
png("plot3.png", height=480, width=680)
ggplot(beaggr, aes(x=factor(year), y=Emissions, fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(. ~ type) +
        xlab("year") +
        ylab("total PM2.5 emission") +
        ggtitle("PM2.5 emissions in Baltimore by source")
dev.off()