# Load data
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/week1')
source("Course_project1.R")

# plot data on png
png(filename="plot2.png",width=480,height=480,units="px")
plot(dataadj$Time,dataadj$Global_active_power,ylab="Global Active Power (kilowatts)", xlab="", type="l")

# close device
dev.off()