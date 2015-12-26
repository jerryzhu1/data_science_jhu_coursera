fileurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/peer_assesment_2')
if (!file.exists('./exdata-data-NEI_data.zip')){
        download.file(fileurl,'./exdata-data-NEI_data.zip')
        unzip("exdata-data-NEI_data.zip", exdir = './')
}

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Question: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)

motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
index <- SCC[motor, ]$SCC
Bal_los <- NEI[(NEI$fips == '24510'|NEI$fips == '06037'),]
Bal_los.motor <- Bal_los[Bal_los$SCC %in% index, ]
Bal_los.motor.sum <- aggregate(Bal_los.motor$Emissions, list(year = Bal_los.motor$year, fips = Bal_los.motor$fips), sum)
names(Bal_los.motor.sum) <- c('Year', 'fips', 'Emissions')
Bal_los.motor.sum$fips <- ifelse(Bal_los.motor.sum$fips == '06037', 'Los Angeles','Baltimore')
png(filename = 'plot6.png')
ggplot(data = Bal_los.motor.sum, aes(x = Year, y = Emissions)) + facet_grid(.~fips) + geom_histogram(stat = 'identity', fill = 'steelblue') + labs(title = 'Emissions from motor vehicle sources in Baltimore City') 
dev.off()

#Answer: Los Angeles have larger volume of PM2.5 emissions from motor vehicle sources than Baltimore. Therefore, Los Angeles has seen greater changes over time in motor vehicle emissions.
