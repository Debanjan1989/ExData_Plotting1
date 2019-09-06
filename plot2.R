download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="HH_power_consumption.zip")
unzip("HH_power_consumption.zip")

library("sqldf")

power_consumption<- read.csv.sql("household_power_consumption.txt",sep=";", header=TRUE,sql = "select * from
                                    file where Date in ('1/2/2007','2/2/2007')",eol="\n")

power_consumption$Date <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png",width = 480, height = 480)

with(power_consumption,plot(Date,Global_active_power,type="l",ylab="Global Active Power(kilowatts)" , xlab = ""))

dev.off()

