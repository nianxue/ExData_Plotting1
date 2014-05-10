power<- read.table("household_power_consumption.txt", header=TRUE, 
           sep=";")

power$date1 <- paste(power$Date,power$Time)

power$date <- strptime(power$date, "%d/%m/%Y %H:%M:%S")

data <- subset(power, 
               power$date >= as.POSIXlt("2007-02-01 00:00:00") & 
                   power$date < as.POSIXlt("2007-02-03 00:00:00"))


png(filename = "plot1.png")

hist(as.numeric(as.character(data$Global_active_power)),breaks=12,
                col= "red",
                xlab="Global Active Power(kilowatts)",
                main="Global Active Power")

#dev.copy(png, file = "plot1.png")
dev.off() ## Don't forget to close the PNG device!

