## Exploratory Data Analysis - Week 1 Assignemnt
## Plot 3
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
powerConsumption$Sub_metering_1 <- as.numeric( powerConsumption$Sub_metering_1 )
powerConsumption$Sub_metering_2 <- as.numeric( powerConsumption$Sub_metering_2 )
powerConsumption$Sub_metering_3 <- as.numeric( powerConsumption$Sub_metering_3 )


png( filename = paste( workingDirectory, "plot3.png" , sep = "/" ) )
## Make the margins a little prettier
par(mar=c(3.1,5.1,4.1,2.1) ) 
## draw it :) 
plot( x    = powerConsumption$DateTime ,
      y    = powerConsumption$Sub_metering_1,
      type = "l" ,
      ylab =  "Energy sub meeting")
lines( x    = powerConsumption$DateTime ,
       y = powerConsumption$Sub_metering_2,
      col  = "red" )
lines( x    = powerConsumption$DateTime ,
       y =  powerConsumption$Sub_metering_3,
      col  = "blue" )
legend("topright" , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black","blue","red") , lty=1)
## close link to .png
dev.off()