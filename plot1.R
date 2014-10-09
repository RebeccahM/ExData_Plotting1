## Load the full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", 
                      quote='\"')

## Convert dates to allow subsetting
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")

## Subset the data
dataComplete$Date <- as.Date(dataComplete$Date, format="%d/%m/%Y")
data <- subset(dataComplete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataComplete)

## Examine the structure of the subsetted data
## str(data)  #2880 obs of 10 variables

## Generate plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save plot 1 to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
