# Load Data
dataPath <- "./household_power_consumption.txt" 
data <- read.table(dataPath, header=T, sep=";", stringsAsFactors=FALSE, dec=".") 
neededData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

dateTime <- strptime(paste(neededData$Date, neededData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(neededData$Global_active_power) 
voltage <- as.numeric(neededData$Voltage)
subMetering1 <- as.numeric(neededData$Sub_metering_1) 
subMetering2 <- as.numeric(neededData$Sub_metering_2) 
subMetering3 <- as.numeric(neededData$Sub_metering_3) 
# Generate Plot 4

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1
plot(dateTime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power") 

# Plot 2
plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage") 

# Plot 3
plot(dateTime, subMetering1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering") 
lines(dateTime, subMetering2, col = "red") 
lines(dateTime, subMetering3, col = "blue") 
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1) 

# Plot 4
plot(dateTime, globalActivePower, type = "l", col = "black", xlab = "datetime", ylab = colnames(neededData)[4]) 

dev.off() 

