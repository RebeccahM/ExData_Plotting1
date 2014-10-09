## Load the full dataset
dataComplete <- read.csv("household_power_consumption.txt", header=T, sep=';', 
                         na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, 
                         comment.char="", quote='\"')

## Convert dates to allow subsetting
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")

## Subset the data
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")
data <- subset(dataComplete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataComplete)

## Merge date and time into one field
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Open png file
png(filename="plot4.png", height=480, width=480)

# Generate plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global_reactive_power",xlab="datetime")
})

## Lose png file
dev.off()