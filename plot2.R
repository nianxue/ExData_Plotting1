power<- read.table("household_power_consumption.txt", header=TRUE, 
           sep=";")

power$date1 <- paste(power$Date,power$Time)

power$date <- strptime(power$date, "%d/%m/%Y %H:%M:%S")

data <- subset(power, 
               power$date >= as.POSIXlt("2007-02-01 00:00:00") & 
                   power$date < as.POSIXlt("2007-02-03 00:00:00"))


png(filename = "plot2.png")

par(mar=c(4,6,2,2))
with(data, plot(date,as.numeric(as.character(Global_active_power)),
                type = "l",
                ylab="Global Active Power(kilowatts)"£¬
                xlab = ""))

#dev.copy(png, file = "plot1.png")
dev.off() ## Don't forget to close the PNG device!

