download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="HH_power_consumption.zip")
unzip("HH_power_consumption.zip")

library("sqldf")

power_consumption<- read.csv.sql("household_power_consumption.txt",sep=";", header=TRUE,sql = "select * from
                                    file where Date in ('1/2/2007','2/2/2007')",eol="\n")

png("plot1.png",width = 480, height = 480)

hist(power_consumption$Global_active_power,col = "red" , xlab ="Global active power(Kilowatts)",main="Global Active Power" )

dev.off()

