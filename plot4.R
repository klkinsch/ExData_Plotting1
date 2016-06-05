## Checks for existence of the data frame, creates it if necessary

if (!exists("epcdata", mode = "list"))  {source("dataPrep.R")}

png(filename = "plot4.png", width = 480, height = 480, units = "px") 
#Set 2 x 2 graphs
par(mfcol = c(2,2))


# Graph 1 - Global active power  
plot(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$globalactivepower, 
     type = "l", xlab = "", ylab = "Global Active Power")


#Graph2 = Sub Metering  
#submetering1
plot(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$submetering1, 
     type = "l", xlab = "", ylab = "Energy sub metering")
#Add submetering2 - red, submetering3 - blue
lines(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$submetering2,
      type = "l", col = "red" )
lines(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$submetering3, 
      type = "l", col = "blue" )  

#Add legend
legend("topright", lty= 1, col = c("Black", "red", "blue"),  cex = 0.75, bty = "n",
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))



#Graph 3 - Voltage 
plot(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#Graph 4 - Global reactive power
plot(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$globalreactivepower,
     type = "l",   xlab = "datetime", ylab = "Global_reactive_power")

dev.off()