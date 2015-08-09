# First we load any packgaes we need later on
library(base)

# Specify the location of the data to load
filename <- './Data/household_power_consumption.txt'

# Now load the data into memory
df  <- read.table(filename,header = TRUE, sep=";")

# Subset the data we are interested in
sdf <- df[ df$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(sdf$Global_active_power)

# Now Lets Plot!
#head(sdf)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",  ylab = "Frequency")
dev.off()