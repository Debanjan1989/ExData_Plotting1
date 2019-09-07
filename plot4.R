download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="HH_power_consumption.zip")
unzip("HH_power_consumption.zip")

library("sqldf")

power_consumption<- read.csv.sql("household_power_consumption.txt",sep=";", header=TRUE,sql = "select * from
                                    file where Date in ('1/2/2007','2/2/2007')",eol="\n")

power_consumption$Date <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 




png("plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

with(power_consumption,plot(Date,Global_active_power,ylab="Global  Active Power",xlab="",type="l"))
with(power_consumption,plot(Date,Voltage,ylab="Voltage",xlab="datetime",type="l"))

with(power_consumption,plot(Date,Sub_metering_1,type="n",ylab="Energy sub metering" , xlab = ""))
points(power_consumption$Date,power_consumption$Sub_metering_1,type = "l",col="black")
points(power_consumption$Date,power_consumption$Sub_metering_2,type = "l",col="red")
points(power_consumption$Date,power_consumption$Sub_metering_3,type = "l",col="blue")
legend("topright",col =c("black","red","blue"),lty=1,lwd=2,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(power_consumption,plot(Date,Global_reactive_power,ylab="Global reactive power",xlab="datetime",type="l"))



dev.off()

