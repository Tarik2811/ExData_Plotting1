
#Exploratory data Analysis project
#plot1

# Project daa (hpcdata) loaded locally 
#---------------------------------------
# Reading csv file hpcdata (household_power_consumption.txt)

hpcfile<- "C:/Users/mbouras/Desktop/Rprog/Mod4-Prjt1/household_power_consumption.txt"
hpcdata <- read.csv(hpcfile, header=T, sep=';', na.strings="?")

# subset data (colected data from 2007-02-01 to 2007-02-02)

hpcdatasub <- subset(hpcdata, Date %in% c("1/2/2007","2/2/2007"))

# date and time conversion 
hpcdatasub$Date <- as.Date(hpcdatasub$Date, format="%d/%m/%Y")

#plot hitogram for subset data (hpcdatasub)

hist(hpcdatasub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save the plot1 as png fie 

png("plot1.png", width=480, height=480)
dev.off()
