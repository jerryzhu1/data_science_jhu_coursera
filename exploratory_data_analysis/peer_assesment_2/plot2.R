fileurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/peer_assesment_2')
if (!file.exists('./exdata-data-NEI_data.zip')){
        download.file(fileurl,'./exdata-data-NEI_data.zip')
        unzip("exdata-data-NEI_data.zip", exdir = './')
}

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Question: Have total emissions PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008?

Bal <- NEI[NEI$fips == '24510',]
Bal.total <- aggregate(Bal$Emissions, list(year = Bal$year), sum)
names(Bal.total) <- c('year', 'Emissions')
png(filename = "plot2.png")
barplot(Bal.total$Emissions/1000, names.arg =  Bal.total$year, xlab = 'Year', ylab = 'Emission(kilotons)', main =  'Total emissions in Baltimore City from 1999 to 2008', col = 'steelblue')
dev.off()

# Answer: Emissions decreased on 2008 compared with 1999, although emissions increased from 2002 to 2015.