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

## Plot 2
plot(subdata$Global_active_power~subdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving File
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()