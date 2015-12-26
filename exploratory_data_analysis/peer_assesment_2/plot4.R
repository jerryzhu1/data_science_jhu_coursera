fileurl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/peer_assesment_2')
if (!file.exists('./exdata-data-NEI_data.zip')){
        download.file(fileurl,'./exdata-data-NEI_data.zip')
        unzip("exdata-data-NEI_data.zip", exdir = './')
}

NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")

# Question: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(ggplot2)
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE) 
coal_combustion <- combustion & coal
index <- SCC[coal_combustion, ]$SCC
US.relate <- NEI[NEI$SCC %in% index, ]
US.relate.sum <- aggregate(US.relate$Emissions, list(year = US.relate$year), sum)
names(US.relate.sum) <- c('Year', 'Emissions')
png(filename = "plot4.png")
ggplot(data = US.relate.sum, aes(x = Year, y = Emissions)) + geom_histogram(stat = 'identity', fill = 'steelblue') + labs(title = 'Emissions from coal combustion-related sources') 
dev.off()
# Answer: Emissions from coal combustion-related decreased from 1999 to 2008.