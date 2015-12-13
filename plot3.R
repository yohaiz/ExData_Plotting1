#Load all data set
hhData <- read.csv2("household_power_consumption.txt", header = TRUE,  dec = ".",sep=';',stringsAsFactors=FALSE,na.strings='?')
#Convert the date column from charcter into actual dates
hhData$Date <- as.Date(hhData$Date,'%d/%m/%Y')
#Subset the dates of interest
hhData <- subset(hhData,hhData$Date>= as.Date('2007-02-01') & hhData$Date<= as.Date('2007-02-02'))
#open PNG graphic device
png(filename = "plot3.png",  width = 480, height = 480, units = "px")
#Set the local so that the xticks will be in english
Sys.setlocale("LC_TIME", "English")
#Combines the time and date columns and convert to POSIXct for use as X axis
t<-as.POSIXct(paste(hhData$Date, hhData$Time))
#Plots the first data line
plot(t,hhData$Sub_metering_1,type = 'l',xlab = NA,ylab = 'Energy sub metering')
#plots the other data lines
lines(t,hhData$Sub_metering_2,col = 'red')
lines(t,hhData$Sub_metering_3,col = 'blue')
#Draws the legend
legend('topright',names(hhData[7:9]),lty = c(1,1,1),col = c('black','red','blue'))
#close the file
dev.off()
