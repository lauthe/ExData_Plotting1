file <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = c("?",""))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
fileset <- file[file$Time >= as.POSIXlt("2007-02-01") & file$Time < as.POSIXlt("2007-02-03"),]
hist(fileset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim = c(0,1200))
dev.copy(png,file="plot1.png")
dev.off()
