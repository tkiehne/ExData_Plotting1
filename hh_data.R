# hh_data.R
#
# Utility library to retrieve and process the “Individual household electric power 
# consumption Data Set” from the UC Irvine Machine Learning Repository and pre-load
# data for subsequent consumption

library(dplyr)

# set wd
script.dir <- dirname(sys.frame(1)$ofile)
setwd(script.dir)

# A function to extract data from a specific file and cache the results for reuse
# Takes POSIXct dates to filter before/after, inclusive
getPowerData <- function(startDate = NULL, endDate = NULL) { 
  if(exists("powerData") && !is.null(powerData))
  {
    return(powerData)
  }
  
  # get data file if not present
  if(!file.exists("exdata-data-household_power_consumption.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./exdata-data-household_power_consumption.zip", mode="wb", method="curl")
  }
  
  # extract data file if not present
  if(!file.exists("household_power_consumption.txt"))
  {
    unzip("exdata-data-household_power_consumption.zip", setTimes=T)
  }
  
  # read data - ideally we'd filter out all except the time frame we are interested in 
  # without loading into memory
  t <- read.table("household_power_consumption.txt", header=T, na.strings="?", sep=";", stringsAsFactors=F)
  
  # fix date / time classes
  t <- mutate(t, Date_Time = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

  if(!is.null(startDate)) {
    t <- filter(t, Date_Time >= startDate)
  }
  
  if(!is.null(endDate)) {
    t <- filter(t, Date_Time <= endDate)
  }
  
  powerData <<- t
  t
}


# For this project we only need data from 2007-02-01 through 2007-02-02
st <- as.POSIXct(strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S"))
ed <- as.POSIXct(strptime("2007-02-02 23:59:59", "%Y-%m-%d %H:%M:%S"))

# pre-load data set
powerData <- getPowerData(st, ed)
