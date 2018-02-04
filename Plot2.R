source("downloadDataSet.R")
Plot2 <- function()
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
  png("Plot2.png", width = 480, height = 480)
  plot(subsetbydate$datetime , subsetbydate$Global_active_power, xlab = "", ylab="Global Active Power (kilowatts)", type = "l")
  dev.off()
}