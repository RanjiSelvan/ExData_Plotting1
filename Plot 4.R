data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

df <- data.frame(subSetData)

datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

activepower <- df$Global_active_power
activepower <- as.character(activepower)
activepower <- as.numeric(activepower)

reactivepower <- df$Global_reactive_power
reactivepower <- as.character(reactivepower)
reactivepower <- as.numeric(reactivepower)

voltage <- df$Voltage
voltage <- as.character(voltage)
voltage <- as.numeric(voltage)

subMetering1 <- df$Sub_metering_1
SM1 <- as.character(subMetering1)
SM1 <- as.numeric(SM1)

subMetering2 <- df$Sub_metering_2
SM2 <- as.character(subMetering2)
SM2 <- as.numeric(SM2)

subMetering3 <- df$Sub_metering_3
SM3 <- as.character(subMetering3)
SM3 <- as.numeric(SM3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, activepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
