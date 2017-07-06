## R code to reconstuct Plot 3

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors =FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
data_sub <- subset(data, data$Date =="2007-02-01" | data$Date =="2007-02-02")

png(file = "Plot3.png")
with (data_sub, plot(DateTime, Sub_metering_1, type="n", xlab = "", ylab ="Energy sub metering"))
with (data_sub, points(DateTime, Sub_metering_1, type="l"))
with (data_sub, points(DateTime, Sub_metering_2, type="l", col="red"))
with (data_sub, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", col = c("black", "blue", "red"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()