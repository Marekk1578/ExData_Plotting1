# First we load any packgaes we need later on
library(base)

# Specify the location of the data to load
filename <- './Data/household_power_consumption.txt'

# Now load the data into memory
df  <- read.table(filename,header = TRUE, sep=";")

# Subset the data we are interested in
sdf <- df[ df$Date %in% c("1/2/2007","2/2/2007"),]

#Clean the data up 
globalActivePower <- as.numeric(sdf$Global_active_power)
datetime <- strptime(paste(sdf$Date, sdf$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Now Lets Plot!
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()