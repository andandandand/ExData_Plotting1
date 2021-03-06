fileName <- "./data/household_power_consumption.txt"
wholeData <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selectedData <- wholeData[wholeData$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selectedData$Global_active_power)
subMeter1 <- as.numeric(selectedData$Sub_metering_1)
subMeter2 <- as.numeric(selectedData$Sub_metering_2)
subMeter3 <- as.numeric(selectedData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()