fileName <- "./wholeData/household_power_consumption.txt"
wholeData <- read.table(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selectedData <- wholeData[wholeData$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selectedData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()