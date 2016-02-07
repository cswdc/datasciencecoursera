# Load Data
dataPath <- "./household_power_consumption.txt" 
data <- read.table(dataPath, header=T, sep=";", stringsAsFactors=FALSE, dec=".") 
neededData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
 
# Generate Plot 1
globalActivePower <- as.numeric(neededData$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 
