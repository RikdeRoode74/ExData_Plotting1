source("downloadDataSet.R")
Plot4 <- function()
{
  DownloadDataSet()
  dataset <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
  #subsetting to 2 days
  subsetbydate <- dataset[(dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007"),]
  #adding a parsed datetime-object
  subsetbydate$datetime <- paste(subsetbydate$Date, subsetbydate$Time)
  subsetbydate$datetime <- strptime(subsetbydate$datetime, "%d/%m/%Y %H:%M:%S")
  #Make string numeric
  subsetbydate$Global_active_power <- as.numeric(subsetbydate$Global_active_power)
  png("Plot4.png", width = 480, height = 480)
  par(mfrow = c(2, 2))
  #plot 1
  plot(subsetbydate$datetime , subsetbydate$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type = "l")
  #plot 2
  plot(subsetbydate$datetime , subsetbydate$Voltage, xlab = "datetime", ylab="Voltage", type = "l")
  #Plot 3
  plot(subsetbydate$datetime , subsetbydate$Sub_metering_1, xlab = "", ylab="Energy sub metering", type = "l")
  points(subsetbydate$datetime , subsetbydate$Sub_metering_2, type = "l", col="red2")
  points(subsetbydate$datetime , subsetbydate$Sub_metering_3, type = "l", col="blue2")
  legend("topright", legend = names(subsetbydate)[7:9], col=c("black", "red", "blue"), lty = c(1, 1, 1), box.lty=0)
  #Plot 4
  plot(subsetbydate$datetime , subsetbydate$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type = "l")
  dev.off()
}