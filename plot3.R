readData <- function(dates) {
    rows <- read.csv("household_power_consumption.txt", sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")

    rows[rows$Date %in% dates, ]
}

data <- readData(c("1/2/2007", "2/2/2007"))

data$timestamp <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png")
plot(data$timestamp, data$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, type="l", col="red")
lines(data$timestamp, data$Sub_metering_3, type="l", col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd="1", col=c("black","red","blue"))
dev.off()
