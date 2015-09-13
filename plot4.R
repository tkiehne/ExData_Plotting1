# plot4.R
#
# Generate a plot using the “Individual household electric power consumption Data Set”
# from the UC Irvine Machine Learning Repository
#
# This plot should present four separate plots:
# 1) A time series plot against Global Active Power (top-left)
# 2) A time series plot versus Voltage (top-right)
# 3) A time series plot versus each sub meter (bottom-left)
# 4) A time series plot against Global Reactive Power (bottom-right)
#
# Requires hh_data.R

source("./hh_data.R")

# Accepting default values for width / height (480px)
png(filename="plot4.png")

par(mfrow=c(2,2))

# top-left
with(powerData, 
    plot(Date_Time, 
         Global_active_power, 
         type="l", 
         main="", 
         xlab="", 
         ylab="Global Active Power"
    )
)

# top-right
with(powerData, 
     plot(Date_Time, 
          Voltage, 
          type="l", 
          main="", 
          xlab="datetime", 
          ylab="Voltage"
     )
)

# bottom-left
with(powerData, {
  plot(Date_Time, 
          Sub_metering_1, 
          type="l", 
          main="", 
          xlab="", 
          ylab="Energy sub metering"
     )
   points(Date_Time, 
          Sub_metering_2, 
          type="l", 
          col="red"
     ) 
   points(Date_Time, 
          Sub_metering_3, 
          type="l", 
          col="blue"
     )
   legend("topright", 
         pch="_", 
         pt.cex=2,
         cex=0.9,
         bty="n",
         col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
     )
  }
)

# bottom-right
with(powerData, 
     plot(Date_Time, 
          Global_reactive_power, 
          type="l", 
          main="", 
          xlab="datetime", 
          ylab="Global_reactive_power"
     )
)

dev.off()