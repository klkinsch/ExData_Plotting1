## Checks for existence of the data frame, creates it if necessary

if (!exists("epcdata", mode = "list"))  {source("dataPrep.R")}

png(filename = "plot3.png", width = 480, height = 480, units = "px") 
#submetering1
plot(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$submetering1, 
     type = "l", xlab = "", ylab = "Energy sub metering")
#Add submetering2 - red, submetering3 - blue
lines(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$submetering2,
      type = "l", col = "red" )
lines(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$submetering3, 
      type = "l", col = "blue" )  

#Add legend
legend("topright", lty= 1, col = c("Black", "red", "blue"),
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()