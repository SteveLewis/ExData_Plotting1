## R code to reconstuct Plot 2

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors =FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S")
data_sub <- subset(data, data$Date =="2007-02-01" | data$Date =="2007-02-02")

png(file = "Plot2.png")
with (data_sub, plot(DateTime, Global_active_power, type="l", xlab = "", ylab ="Global Active Power (kilowatts)"))
dev.off()