library(dplyr); library(lubridate)

PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
PowerData <- tbl_df(PowerData)

## Read and reformatting data
PowerData <- PowerData %>%
        mutate(Date = dmy(Date)) %>%
        filter(Date >= ymd("2007-02-01"), Date <= ymd("2007-02-02")) %>%
        arrange(Date) %>%
        print()


## Plotting
png("plot1.png")
HistogramPlot <- hist(PowerData$Global_active_power, col = "red", 
                      xlab = "Global Active Power (kilowatts)", 
                      ylab = "Frequency", 
                      main = "Global Active Power")
dev.off()
