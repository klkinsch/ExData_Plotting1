##dataPrep.R assumes the following
#   1. data file household_power_consumption.txt resides in the data folder in the 
#       same path that the r script is run
#   2. packages dplyr and data.table are installed
##
##dataPrep.R does the following
#   1. Loads packages dplyr and data.table
#   2. Loads Electric Power Consumption data
#         Use fread Fast and friendly file finagler - recognize ? as NA
#         Subsets data for 2007-02-01 and 2007-02-02
#         Make data tidy


library(dplyr)
library(data.table)

 
# Read data with Fast and friendly file finagler and then subset for 2007-02-01 and 2007-02-02
fastRead <- fread("./data/household_power_consumption.txt", na.strings="?",stringsAsFactors = FALSE)
epcdata <- filter(fastRead, grep("^[1,2]/2/2007", Date))

#  Transform data
#Set date and time data 
epcdata$dateTime <-paste(epcdata$Date, epcdata$Time) 
epcdata$Date <- as.Date(epcdata$Date, format = "%d/%m/%Y" )

#Tidy variable names
names(epcdata) <- gsub("_","",names(epcdata)) 
names(epcdata) <- tolower(names(epcdata))

#Convert to numeric
##epcdata[,c(3:9)]= apply(epcdata[,c(3:9)], 2, function(x) as.numeric(as.character(x)))

   