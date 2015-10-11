## Read data into R
powerData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")  ## Convert the class of Date from factor to Date
dateTime <- paste(powerData$Date, powerData$Time)
powerData$Time <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")   ## Convert the class of Time from factor to POSIXlt
usableData <- subset(powerData, powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02")  ## Subset the data

## Making plots
par(mfrow = c(1, 1))
hist(usableData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

## Send the plot to file device PNG
dev.copy(png, file = "plot1.png")
dev.off()

