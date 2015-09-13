# plot1.R
#
# Generate a plot using the “Individual household electric power consumption Data Set”
# from the UC Irvine Machine Learning Repository
#
# This plot should present a histogram of global active power in kW for the
# date range 2007-02-01 through 2007-02-02
#
# Requires hh_data.R

source("./hh_data.R")

# Accepting default values for width / height (480px)
png(filename="plot1.png")

hist(powerData$Global_active_power, 
     col = "red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"
     )

dev.off()