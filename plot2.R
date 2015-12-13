#Load all data set
hhData <- read.csv2("household_power_consumption.txt", header = TRUE,  dec = ".",sep=';',stringsAsFactors=FALSE,na.strings='?')
#Convert the date column from charcter into actual dates
hhData$Date <- as.Date(hhData$Date,'%d/%m/%Y')
#Subset the dates of interest
hhData <- subset(hhData,hhData$Date>= as.Date('2007-02-01') & hhData$Date<= as.Date('2007-02-02'))
#open PNG graphic device
png(filename = "plot2.png",  width = 480, height = 480, units = "px")
#Set the local so that the xticks will be in english
Sys.setlocale("LC_TIME", "English")
#Plots global active power as function of time
plot(as.POSIXct(paste(hhData$Date, hhData$Time)),hhData$Global_active_power,type = 'l',xlab = NA,ylab = 'Global active power (kilowatts)')
#close the file
dev.off()
