## Read data into R
powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")  ## Convert the class of Date from factor to Date
dateTime <- paste(powerData$Date, powerData$Time)
powerData$Time <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")   ## Convert the class of Time from factor to POSIXlt
usableData <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")  ## Subset the data

## Making plot
par(mfrow = c(2, 2))
# First plot
plot(usableData$Time, usableData$Global_active_power, type = "l", xlab = "", ylab = "Global Avtive Power")
# Second plot
plot(usableData$Time, usableData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
# Third plot
with(usableData, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(usableData, {
        lines(Time, Sub_metering_2, col = "red")
        lines(Time, Sub_metering_3, col = "blue")
})
legend("topright", bty = "n", cex = 0.7, lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
# Fourth plot
plot(usableData$Time, usableData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# Save the plots
dev.copy(png, "plot4.png")
dev.off()
