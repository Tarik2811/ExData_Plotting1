

# Reading csv file hpcdata (household_power_consumption.txt)

hpcfile<- "C:/Users/mbouras/Desktop/Rprog/Mod4-Prjt1/household_power_consumption.txt"
hpcdata <- read.csv(hpcfile, header=T, sep=';', na.strings="?")

# subset data (colected data from 2007-02-01 to 2007-02-02)

hpcdatasub <- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))

# date and time conversion 
hpcdatasub$Date <- as.Date(hpcdatasub$Date, format="%d/%m/%Y")

#plot4 (hpcdatasub)
datetime <- paste(as.Date(hpcdatasub$Date), hpcdatasub$Time)
hpcdatasub$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))
par(mar=c(4,4,4,4))

plot(hpcdatasub$Datetime, hpcdatasub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(hpcdatasub$Datetime, hpcdatasub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(hpcdatasub$Datetime, hpcdatasub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(hpcdatasub$Datetime, hpcdatasub$Sub_metering_2, type = "l", col = "red")

points(hpcdatasub$Datetime, hpcdatasub$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.8)

plot(hpcdatasub$Datetime, hpcdatasub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


#Save the plot4 as png fie 
png("plot4.png", width=480, height=480)
dev.off()