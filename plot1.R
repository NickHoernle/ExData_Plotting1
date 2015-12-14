## Exploratory Data Analysis - Week 1 Assignemnt
## Plot 1
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
powerConsumption$Date   <- as.Date( powerConsumption$Date , format = "%d/%m/%Y" )
powerConsumption$Global_active_power <- as.numeric( powerConsumption$Global_active_power )

## Draw the histogram
## to a .png file
png( filename = paste( workingDirectory, "plot1.png" , sep = "/" ) )
## Make the margins a little prettier
par(mar=c(5.1,5.1,4.1,2.1) ) 
## draw it :) 
hist( x    = powerConsumption$Global_active_power ,
      xlab = "Global Active Power (kilowatts)" , 
      col  = "red" , 
      main = "Global Active Power")
## close link to .png
dev.off()