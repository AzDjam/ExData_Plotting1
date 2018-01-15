

# read CSv file
df = read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                  stringsAsFactors=F)

# extract data from dataframe for the two dates  1/2/200 and  2/2/2007
df_2007 = subset(df, Date %in% c("1/2/2007","2/2/2007"))

# convert Date  from chr to class "Date" representing calendar dates 
df_2007$Date <- as.Date(df_2007$Date, format="%d/%m/%Y")
#convert globalActivePower to numeric
Global_active_power <- as.numeric(df_2007$Global_active_power)

#Construct the plot and save it  to a plot1.png  
png ('plot1.png',width=480,height = 480)
hist(Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
