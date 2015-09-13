# plot3.R
#
# Generate a plot using the “Individual household electric power consumption Data Set”
# from the UC Irvine Machine Learning Repository
#
# This plot should present a time series of each sub meter for the
# date range 2007-02-01 through 2007-02-02
#
# Requires hh_data.R

source("./hh_data.R")

# Accepting default values for width / height (480px)
png(filename="plot3.png")

with(powerData, 
     plot(Date_Time, 
          Sub_metering_1, 
          type="l", 
          main="", 
          xlab="", 
          ylab="Energy sub metering"
     )
)

with(powerData, 
     points(Date_Time, 
            Sub_metering_2, 
            type="l", 
            col="red"
     )
)

with(powerData, 
     points(Date_Time, 
            Sub_metering_3, 
            type="l", 
            col="blue"
     )
)

legend("topright", 
       pch="_", 
       pt.cex=2,
       col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       )

dev.off()