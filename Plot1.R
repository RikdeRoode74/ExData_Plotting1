source("downloadDataSet.R")
Plot1 <- function()
{
  DownloadDataSet()
  dataset <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
  #subsetting to 2 days
  subsetbydate <- dataset[(dataset$Date=="1/2/2007"|dataset$Date=="2/2/2007"),]
  #Make string numeric
  subsetbydate$Global_active_power <- as.numeric(subsetbydate$Global_active_power)
  #writing plot to png
  png("Plot1.png", width = 480, height = 480)
  hist(subsetbydate$Global_active_power, col="red2", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
}