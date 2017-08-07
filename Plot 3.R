data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subMetering1 <- subSetData$Sub_metering_1
SM1 <- as.character(subMetering1)
SM1 <- as.numeric(SM1)

subMetering2 <- subSetData$Sub_metering_2
SM2 <- as.character(subMetering2)
SM2 <- as.numeric(SM2)

subMetering3 <- subSetData$Sub_metering_3
SM3 <- as.character(subMetering3)
SM3 <- as.numeric(SM3)

png("plot3.png", width=480, height=480)
plot(datetime, SM1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()