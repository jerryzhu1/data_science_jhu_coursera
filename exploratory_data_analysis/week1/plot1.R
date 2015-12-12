# Load data
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/week1')
source("Course_project1.R")

# plot data on png
png(filename="plot1.png",width=480,height=480,units="px")
hist(dataadj$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

# Turn off device
dev.off()