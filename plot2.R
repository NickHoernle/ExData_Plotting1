## Exploratory Data Analysis - Week 1 Assignemnt
## Plot 2
## Nicholas Hoernle
## 11/12/2015

## Note: if you did not download the "houshold_power_consumption.txt" please place in this root folder
##          this can be downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Note: set the working directory to the location of this project (please update)
workingDirectory <- "F:/Development/R/ExData/ExData_Plotting1"
setwd(workingDirectory)

## Imports:
library(data.table)
library(dplyr)

## Only read the data from the dates 2007-02-01 and 2007-02-02
powerConsumption        <- filter( fread( input = "household_power_consumption.txt" ), 
                               Date == "1/2/2007"  | Date == "2/2/2007"  )
powerConsumption$DateTime   <- as.POSIXct( strptime( paste( 
                                    powerConsumption$Date,
                                    powerConsumption$Time,
                                    sep = " "
                                )
                                , format = "%e/%m/%Y %H:%M:%S" ) )
powerConsumption$Global_active_power <- as.numeric( powerConsumption$Global_active_power )


png( filename = paste( workingDirectory, "plot2.png" , sep = "/" ) )
## Make the margins a little prettier
par(mar=c(3.1,5.1,4.1,2.1) ) 
## draw it :) 
plot( x    = powerConsumption$DateTime ,
      y    = powerConsumption$Global_active_power,
      type = "l",
      ylab = "Global Active Power (kilowatts)",
      xlab = "" )
## close link to .png
dev.off()