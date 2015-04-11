# Reading data from text file
pdata <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

# Adding a new date/time column to pdata data frame, which will be used for sub setting the data 
pdata$dtcol <- strptime(paste(pdata$Date, pdata$Time), "%d/%m/%Y %H:%M:%S")

# Sub setting data for 2 days
pdata <- subset(pdata, pdata$dtcol >= "2007-02-01 00:00:00" & pdata$dtcol < "2007-02-03 00:00:00")

# Conversion of necessary columns for plotting graphs
pdata$Global_active_power <- as.numeric(pdata$Global_active_power)
pdata$Sub_metering_3 <- as.numeric(pdata$Sub_metering_3)
pdata$Sub_metering_2 <- as.numeric(pdata$Sub_metering_2)
pdata$Sub_metering_1 <- as.numeric(pdata$Sub_metering_1)

# Initiating graph plot in png file
png("plot3.png")
plot(pdata$dtcol,pdata$Sub_metering_1, type = 'l', ylab = 'Energy Sub Metering', xlab ='')
lines(pdata$dtcol, pdata$Sub_metering_2, col = 'red')
lines(pdata$dtcol, pdata$Sub_metering_3, col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()