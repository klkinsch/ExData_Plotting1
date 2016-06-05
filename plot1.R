## Checks for existence of the data frame, creates it if necessary

if (!exists("epcdata", mode = "list"))  {source("dataPrep.R")}

# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

#Histogram for Global Active Power
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(epcdata$globalactivepower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
