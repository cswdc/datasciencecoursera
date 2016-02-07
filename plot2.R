# Load Data
dataPath <- "./household_power_consumption.txt" 
data <- read.table(dataPath, header=T, sep=";", stringsAsFactors=FALSE, dec=".") 
neededData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

# Generate Plot 1
dateTime <- strptime(paste(neededData$Date, neededData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalActivePower <- as.numeric(neededData$Global_active_power) 
png("plot2.png", width=480, height=480) 
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 
