file <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = c("?",""))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
fileset <- file[file$Time >= as.POSIXlt("2007-02-01") & file$Time < as.POSIXlt("2007-02-03"),]
plot(fileset$Time,fileset$Global_active_power, type ="n",xlab="", ylab = "Global Active Power (kilowatts)")
lines(fileset$Time,fileset$Global_active_power)
dev.copy(png,file="plot2.png")
dev.off()
