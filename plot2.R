## Checks for existence of the data frame, creates it if necessary

if (!exists("epcdata", mode = "list"))  {source("dataPrep.R")}

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png(filename = "plot2.png", width = 480, height = 480, units = "px") 
plot(strptime(epcdata$datetime, "%d/%m/%Y %H:%M:%S"), epcdata$globalactivepower, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()