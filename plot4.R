
# read CSv file
df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               stringsAsFactors=F)

# extract data from datframe for the two dates  1/2/200 and  2/2/2007
df_2007 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

#convert Date and Time 
date_time <- strptime(paste(df_2007$Date, df_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(df_2007$Global_active_power)
Global_reactive_power<- as.numeric(df_2007$Global_reactive_power)
#convert Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric
voltage <- as.numeric(df_2007$Voltage)
Sub_metering_1 <- as.numeric(df_2007$Sub_metering_1)
Sub_metering_2 <- as.numeric(df_2007$Sub_metering_2)
Sub_metering_3 <- as.numeric(df_2007$Sub_metering_3)

#Construct the plot and save it  to a plot4.png
png('plot4.png',width=480,height=480)
par(mfrow = c(2, 2)) 
plot(Date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Date_time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_time, Sub_metering_2, type="l", col="red")
lines(Date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(Date_time, Global_reactive_power, type="l", xlab="Date_time", ylab="Global_reactive_power")
dev.off()

