file <- read.table("household_power_consumption.txt", header = TRUE, sep= ";", na.strings = c("?",""))
file$Date <- as.Date(file$Date, format = "%d/%m/%Y")  
file$timetemp <- paste(file$Date, file$Time)
file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
fileset <- file[file$Time >= as.POSIXlt("2007-02-01") & file$Time < as.POSIXlt("2007-02-03"),]
plot(fileset$Time,fileset$Sub_metering_1, type ="n",xlab="", ylab = "Energy sub metering")
lines(fileset$Time, fileset$Sub_metering_1, col = "black")
lines(fileset$Time, fileset$Sub_metering_2, col = "red")
lines(fileset$Time, fileset$Sub_metering_3, col = "blue")
legend("topright", lty= c(1,1), col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()


