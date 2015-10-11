## Read data into R
powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")  ## Convert the class of Date from factor to Date
dateTime <- paste(powerData$Date, powerData$Time)
powerData$Time <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")   ## Convert the class of Time from factor to POSIXlt
usableData <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")  ## Subset the data

## Making plot
par(mfrow = c(1, 1))
plot(usableData$Time, usableData$Global_active_power, type = "l", xlab = "", ylab = "Global Avtive Power (kilowatts)")

## Send the plot to PNG file
dev.copy(png, file = "plot2.png")
dev.off()


