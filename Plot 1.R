data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

df <- data.frame(subSetData)

activepower <- df$Global_active_power
activepower <- as.character(activepower)
activepower <- as.numeric(activepower)

png("plot1.png", width=480, height=480)
hist(activepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

  