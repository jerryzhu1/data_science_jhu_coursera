# Read data
data = read.table('/Users/zhusiqi/Desktop/coursera/R_jhu/exploratory_data_analysis/week1/household_power_consumption.txt',header = TRUE, sep = ';',stringsAsFactors = FALSE)

# Select data
dataadj = subset(data,data$Date %in% c("1/2/2007","2/2/2007"))

# Convert data
dataadj$Time <- strptime(paste(dataadj$Date, dataadj$Time), "%d/%m/%Y %H:%M:%S")
dataadj$Global_active_power <- as.numeric(dataadj$Global_active_power)
dataadj$Global_reactive_power <- as.numeric(dataadj$Global_reactive_power)
dataadj$Voltage <- as.numeric(dataadj$Voltage)
dataadj$Sub_metering_1 <- as.numeric(dataadj$Sub_metering_1)
dataadj$Sub_metering_2 <- as.numeric(dataadj$Sub_metering_2)
dataadj$Sub_metering_3 <- as.numeric(dataadj$Sub_metering_3)