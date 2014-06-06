readData <- function(dates) {
    rows <- read.csv("household_power_consumption.txt", sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")

    rows[rows$Date %in% dates, ]
}

data <- readData(c("1/2/2007", "2/2/2007"))

png(filename="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
