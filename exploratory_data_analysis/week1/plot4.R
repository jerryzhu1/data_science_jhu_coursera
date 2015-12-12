# Load data
setwd('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/week1')
source("Course_project1.R")

# open png
png(filename = "plot4.png", width = 480, height = 480,units = "px")

# set par to plot 4 graph
par(mfrow = c(2, 2))

## plot data
# graph 1 (top left)
plot(dataadj$Time, dataadj$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

# graph 2 (bottom left)
plot(dataadj$Time, dataadj$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# graph 3 (top right)
plot(dataadj$Time, dataadj$Sub_metering_1, type = "l", col='black', xlab = "", ylab = "Energy sub metering")
lines(dataadj$Time, dataadj$Sub_metering_2, col = 'red')
lines(dataadj$Time, dataadj$Sub_metering_3, col = 'blue')

#add legend
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = "solid", bty = 'n')

# graph 3 (bottom right)
plot(dataadj$Time, dataadj$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# close device
dev.off()