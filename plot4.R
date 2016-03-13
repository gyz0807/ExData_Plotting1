library(dplyr); library(lubridate)

PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
PowerData <- tbl_df(PowerData)

## Read and reformatting data
PowerData1 <- PowerData %>%
        mutate(DateTime = paste(Date, Time), DateTime = dmy_hms(DateTime)) %>%
        mutate(Date = dmy(Date)) %>%
        filter(Date >= ymd("2007-02-01"), Date <= ymd("2007-02-02")) %>%
        arrange(Date) %>%
        print()

## Plotting
png("plot4.png")

par(mfrow = c(2, 2))

## Plot1
with(PowerData1, plot(DateTime, Global_active_power, type = "l", xlab = "",
                      ylab = "Global Active Power"))
## Plot2
with(PowerData1, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

## Plot3
with(PowerData1, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(PowerData1, lines(DateTime, Sub_metering_2, col = "red"))
with(PowerData1, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

## Plot4
with(PowerData1, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()
