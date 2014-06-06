readData <- function(dates) {
    rows <- read.csv("household_power_consumption.txt", sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")

    rows[rows$Date %in% dates, ]
}

data <- readData(c("1/2/2007", "2/2/2007"))

png(filename="plot2.png")
plot(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
dev.off()
