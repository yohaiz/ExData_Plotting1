#Load all data set
hhData <- read.csv2("household_power_consumption.txt", header = TRUE,  dec = ".",sep=';',stringsAsFactors=FALSE,na.strings='?')
#Convert the date column from charcter into actual dates
hhData$Date <- as.Date(hhData$Date,'%d/%m/%Y')
#Subset the dates of interest
hhData <- subset(hhData,hhData$Date>= as.Date('2007-02-01') & hhData$Date<= as.Date('2007-02-02'))
#open PNG graphic device
png(filename = "plot1.png",  width = 480, height = 480, units = "px")
#Draw histogram of global active power
hist(hhData$Global_active_power,main = 'Gloabal Active Power',xlab = 'Global Active Power(Killowatts)',col = 'red')
#close the file
dev.off()
