fileurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/peer_assesment_2')
if (!file.exists('./exdata-data-NEI_data.zip')){
        download.file(fileurl,'./exdata-data-NEI_data.zip')
        unzip("exdata-data-NEI_data.zip", exdir = './')
}

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

Emissions.total <- aggregate(NEI$Emissions, list(year = NEI$year), sum)
names(Emissions.total) <- c('year', 'Emissions')
png(filename = "plot1.png")
barplot(Emissions.total$Emissions/1000, names.arg =  Emissions.total$year, xlab = 'Year', ylab = 'Emission(kilotons)', main =  'Total emissions from 1999 to 2008', col = 'steelblue')
dev.off()

# Answer: Yes.
