# First we load any packgaes we need later on
library(base)

# Specify the location of the data to load
filename <- './Data/household_power_consumption.txt'

# Now load the data into memory
df  <- read.table(filename,header = TRUE, sep=";")

# Subset the data we are interested in
sdf <- df[ df$Date %in% c("1/2/2007","2/2/2007"),]

#Clean the data up 
#globalActivePower <- as.numeric(sdf$Global_active_power)
datetime <- strptime(paste(sdf$Date, sdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- as.numeric(sdf$Sub_metering_1)
subMeter2 <- as.numeric(sdf$Sub_metering_2)
subMeter3 <- as.numeric(sdf$Sub_metering_3)

# Now Lets Plot!
png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", xlab="", ylab="Energy Sub Metering")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
