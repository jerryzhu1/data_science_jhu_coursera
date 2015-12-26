fileurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/peer_assesment_2')
if (!file.exists('./exdata-data-NEI_data.zip')){
        download.file(fileurl,'./exdata-data-NEI_data.zip')
        unzip("exdata-data-NEI_data.zip", exdir = './')
}

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Question : Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
library(ggplot2)
Bal <- NEI[NEI$fips == '24510',]
Bal.type <- aggregate(Bal$Emissions, list(type = Bal$type, year = Bal$year), sum)
names(Bal.type) <- c('Type', 'Year', 'Emissions')
png(filename = "plot3.png")
ggplot(data = Bal.type, aes(x = Year, y = Emissions, fill = Type)) + geom_histogram(stat = 'identity')+ facet_grid(.~Type) 
dev.off()

#Answer: Non-road, nonpoint and on-road decreased from 1999 to 2008.
