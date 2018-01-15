
# read CSv file
df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               stringsAsFactors=F)

# extract data from dataframe for the two dates  1/2/200 and  2/2/2007
df_2007 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

#convert  Date and Time 
Date_time <- strptime(paste(df_2007$Date, df_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#convert Sub_metering_1,Sub_metering_2,Sub_metering_3 to numeric
Sub_metering_1 <- as.numeric(df_2007$Sub_metering_1)
Sub_metering_2 <- as.numeric(df_2007$Sub_metering_2)
Sub_metering_3 <- as.numeric(df_2007$Sub_metering_3)

#Construct the plot and save it  to a plot3.png 
png('plot3.png',width=480,height=480)
plot(Date_time, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_time, Sub_metering_2, type="l", col="red")
lines(Date_time, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
