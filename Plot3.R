

# Reading csv file hpcdata (household_power_consumption.txt)

hpcfile<- "C:/Users/mbouras/Desktop/Rprog/Mod4-Prjt1/household_power_consumption.txt"
hpcdata <- read.csv(hpcfile, header=T, sep=';', na.strings="?")

# subset data (colected data from 2007-02-01 to 2007-02-02)

hpcdatasub <- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))

# date and time conversion 
hpcdatasub$Date <- as.Date(hpcdatasub$Date, format="%d/%m/%Y")

# plot 3
datetime <- paste(as.Date(hpcdatasub$Date), hpcdatasub$Time)
hpcdatasub$Datetime <- as.POSIXct(datetime)


#Save the plot3 as png fie 
with(hpcdatasub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
  
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save the plot3 as png fie 
png("plot3.png", width=480, height=480)
dev.off()