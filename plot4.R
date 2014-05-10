power<- read.table("household_power_consumption.txt", header=TRUE, 
           sep=";")

power$date1 <- paste(power$Date,power$Time)

power$date <- strptime(power$date, "%d/%m/%Y %H:%M:%S")

data <- subset(power, 
               power$date >= as.POSIXlt("2007-02-01 00:00:00") & 
                   power$date < as.POSIXlt("2007-02-03 00:00:00"))


png(filename = "plot4.png")

par(mfrow = c(2,2), mar = c(4,6,2,2))
with(data, {plot(date,as.numeric(as.character(Global_active_power)),
                type = "l",
                ylab="Global Active Power",
                xlab = "")
            
            plot(date,as.numeric(as.character(Voltage)),
                 type = "l",
                 ylab="Voltage",
                 xlab = "datetime")
            
            plot(date,as.numeric(as.character(Sub_metering_1)),
                 type = "l",
                 ylab="Energy sub metering",
                 xlab = "")
            
            lines(date,as.numeric(as.character(Sub_metering_2)),
                  type = "l",
                  col = "red")
            
            lines(date,as.numeric(as.character(Sub_metering_3)),
                  type = "l",
                  col = "blue")
            
            legend("topright", col=c("black","red","blue"), 
                   lty = 1,
                   legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                   cex = 0.6)
            
            plot(date,as.numeric(as.character(Global_reactive_power)),
                 type = "l",
                 ylab="Global_reactive_power",
                 xlab = "datetime")})



#dev.copy(png, file = "plot1.png")
dev.off() ## Don't forget to close the PNG device!

