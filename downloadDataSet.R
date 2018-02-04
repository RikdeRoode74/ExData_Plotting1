DownloadDataSet <- function()
{
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  filename <- "householdPowerConsumption.zip"
  if(!file.exists(filename)){
    download.file(url, destfile=filename)
    dateDownloaded <- date()
    unzip(filename)
  }
}