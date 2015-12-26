fileurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/peer_assesment_2')
if (!file.exists('./exdata-data-NEI_data.zip')){
        download.file(fileurl,'./exdata-data-NEI_data.zip')
        unzip("exdata-data-NEI_data.zip", exdir = './')
}

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Question: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)

motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
index <- SCC[motor, ]$SCC
Bal <- NEI[NEI$fips == '24510',]
Bal.veh <- Bal[Bal$SCC %in% index, ]
Bal.veh.sum <- aggregate(Bal.veh$Emissions, list(year = Bal.veh$year), sum)
names(Bal.veh.sum) <- c('Year', 'Emissions')
png(filename = "plot5.png")
ggplot(data = Bal.veh.sum, aes(x = Year, y = Emissions)) + geom_histogram(stat = 'identity', fill = 'steelblue') + labs(title = 'Emissions from motor vehicle sources in Baltimore City') 
dev.off()

# Answer: Emissions from motor vehicle sources decreased from 1999–2008 in Baltimore City.

