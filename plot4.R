## Exploratory Data Analysis - Week 1 Assignemnt
## Plot 4
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
powerConsumption$Voltage <- as.numeric( powerConsumption$Voltage )
powerConsumption$Global_reactive_power <- as.numeric( powerConsumption$Global_reactive_power )
powerConsumption$Sub_metering_1 <- as.numeric( powerConsumption$Sub_metering_1 )
powerConsumption$Sub_metering_2 <- as.numeric( powerConsumption$Sub_metering_2 )
powerConsumption$Sub_metering_3 <- as.numeric( powerConsumption$Sub_metering_3 )


## Make the graph
png( filename = paste( workingDirectory, "plot4.png" , sep = "/" ) )

## Make the margins a little prettier
par(mar=c(4.1,4,4,2.1) ) 

## define we'll have 4 plots
par( mfrow=c(2,2) ) # working along the rows

## Position (1,1)
plot( x    = powerConsumption$DateTime ,
      y    = powerConsumption$Global_active_power,
      type = "l",
      ylab = "Global Active Power",
      xlab = "" )

## Plot (2,1)
plot( x    = powerConsumption$DateTime ,
      y    = powerConsumption$Voltage,
      type = "l",
      ylab = "Voltage",
      xlab = "datetime" )

## Plot (1,2)
plot( x    = powerConsumption$DateTime ,
      y    = powerConsumption$Sub_metering_1,
      type = "l" ,
      ylab =  "Energy sub meeting",
      xlab = "")
lines( x    = powerConsumption$DateTime ,
       y = powerConsumption$Sub_metering_2,
      col  = "red" )
lines( x    = powerConsumption$DateTime ,
       y =  powerConsumption$Sub_metering_3,
      col  = "blue" )
legend("topright" , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black","blue","red") , lty=1)

## Plot (2,2)
plot( x    = powerConsumption$DateTime ,
      y    = powerConsumption$Global_reactive_power,
      type = "l",
      xlab = "datetime",
      ylab = "")

## close link to .png
dev.off()