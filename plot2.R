# plot2.R
#
# Generate a plot using the “Individual household electric power consumption Data Set”
# from the UC Irvine Machine Learning Repository
#
# This plot should present a time series of global active power utilization in kW for the
# date range 2007-02-01 through 2007-02-02
#
# Requires hh_data.R

source("./hh_data.R")

# Accepting default values for width / height (480px)
png(filename="plot2.png")

plot(powerData$Date_Time, 
     powerData$Global_active_power, 
     type="l", 
     main="", 
     xlab="", 
     ylab="Global Active Power (kilowatts)"
     )

dev.off()