

# Reading csv file hpcdata (household_power_consumption.txt)

hpcfile<- "C:/Users/mbouras/Desktop/Rprog/Mod4-Prjt1/household_power_consumption.txt"
hpcdata <- read.csv(hpcfile, header=T, sep=';', na.strings="?")

# subset data (colected data from 2007-02-01 to 2007-02-02)

hpcdatasub <- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))

# date and time conversion 
hpcdatasub$Date <- as.Date(hpcdatasub$Date, format="%d/%m/%Y")

#plot2 from (hpcdatasub)
datetime <- paste(as.Date(hpcdatasub$Date), hpcdatasub$Time)
hpcdatasub$Datetime <- as.POSIXct(datetime)

with(hpcdatasub, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


#Save the plot2 as png fie 
png("plot2.png", width=480, height=480)
dev.off()
