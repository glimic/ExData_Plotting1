Sys.setlocale("LC_TIME", "C")
data=read.table("household_power_consumption.txt", skip=397+46*24*60, nrows = 2*24*60,
sep = ";", col.names=c("Date","Time","Global_Active_Power","Global_Reactive_Power","Voltage","GI","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
datetime=strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data=data.frame(datetime,data[3:9])

plot(datetime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datetime,data$Sub_metering_2,col="red")
lines(datetime,data$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,'plot3.png')
dev.off()
