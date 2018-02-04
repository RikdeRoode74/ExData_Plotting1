source("downloadDataSet.R")
Plot3 <- function()
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
  png("Plot3.png", width = 480, height = 480)
  plot(subsetbydate$datetime , subsetbydate$Sub_metering_1, xlab = "", ylab="energy sub metering", type = "l")
  points(subsetbydate$datetime , subsetbydate$Sub_metering_2, type = "l", col="red2")
  points(subsetbydate$datetime , subsetbydate$Sub_metering_3, type = "l", col="blue2")
  legend("topright", legend = names(subsetbydate)[7:9], col=c("black", "red", "blue"), lty = c(1, 1, 1))
  dev.off()
}