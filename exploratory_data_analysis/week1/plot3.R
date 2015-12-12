# Load data
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/week1')
source("Course_project1.R")

# plot data on png
png(filename="plot3.png",width=480,height=480,units="px")
plot(dataadj$Time, dataadj$Sub_metering_1, type = "l", col='black', xlab = "", ylab = "Energy sub metering")
lines(dataadj$Time, dataadj$Sub_metering_2, col = 'red')
lines(dataadj$Time, dataadj$Sub_metering_3, col = 'blue')

# add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty="solid")

# close device
dev.off()