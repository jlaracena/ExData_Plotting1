## Set WorkDir and clean
setwd("~/Dropbox/Data Science/Hopking University/C4_Exporatory_Data_Analysis/Week1/Assignment")
rm(list = ls())

## Clean plots
dev.off(dev.list())

## Dataset
data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
fechas <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(fechas)

## Plot 3
with(subdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving file
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
