library(dplyr); library(lubridate)

PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
PowerData <- tbl_df(PowerData)

## Read and reformatting data
PowerData1 <- PowerData %>%
        select(Date:Global_active_power) %>%
        mutate(DateTime = paste(Date, Time), DateTime = dmy_hms(DateTime)) %>%
        mutate(Date = dmy(Date)) %>%
        filter(Date >= ymd("2007-02-01"), Date <= ymd("2007-02-02")) %>%
        arrange(Date) %>%
        print()

## Plotting
png("plot2.png")
with(PowerData1, plot(DateTime, Global_active_power, type = "l", xlab = "",
                      ylab = "Global Active Power (kilowatts)"))
dev.off()