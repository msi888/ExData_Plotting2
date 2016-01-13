# Read files
NEI <- readRDS("summarySCC_PM25.rds")
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 1999:2008?
be <- NEI[NEI$fips=="24510",]
bey <- aggregate(Emissions ~ year, be, sum)
str(bey)

png('plot2.png')
barplot(height=bey$Emissions,names.arg=bey$year,xlab="years", ylab="total PM2.5 emission",
        main="total PM2.5 emissions Baltimore per year", col= "blue")
dev.off()