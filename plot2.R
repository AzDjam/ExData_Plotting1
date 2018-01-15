


# read CSv file
df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               stringsAsFactors=F)

# extract data from datframe for the two dates  1/2/200 and  2/2/2007
df_2007 <- subset(df, Date %in% c("1/2/2007","2/2/2007"))

 
Date_time <- strptime(paste(df_2007$Date, df_2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(df_2007$Global_active_power)

#Construct the plot and save it  to a plot2.png  
png('plot2.png',width=480,height=480)
plot(Date_time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
