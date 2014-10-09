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

## Generate plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
