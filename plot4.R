##Read in data

power <- read.table("C:...household_power_consumption.txt",sep=";",header=T)

## Convert dates from factor format to date format

power$Date <- as.Date(power$Date, "%d/%m/%Y")

## subset dataset from 02/01/2007 and 02/02/2007

powersub <- subset(power, Date == "2007-02-01")
powersub2 <- subset(power, Date == "2007-02-02")
subpower<- rbind(powersub,powersub2)

##convert necessary variables to numeric

subpower$Global_active_power <- as.numeric(as.character(subpower$Global_active_power))
subpower$Voltage <- as.numeric(as.character(subpower$Voltage))
subpower$Sub_metering_1 <- as.numeric(as.character(subpower$Sub_metering_1))
subpower$Sub_metering_2 <- as.numeric(as.character(subpower$Sub_metering_2))
subpower$Sub_metering_3 <- as.numeric(as.character(subpower$Sub_metering_3))
subpower$Global_reactive_power <- as.numeric(as.character(subpower$Global_reactive_power))

###plot 4

## creating settings for 4 plots on one page

par(mfrow=c(2,2))
par(mar=c(4,2,2,2))

###plots, in order, across rows

##top left graph
plot(subpower$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)",
     typ="l", xaxt = "n")
axis(side=1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))

##top right graph
plot(subpower$Voltage, typ="l", xaxt="n", xlab="datetime", ylab="Voltage")
axis(side=1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))

##bottom left graph
plot(subpower$Sub_metering_1, xlab="",ylab="Energy sub metering",
     typ="l", xaxt = "n")
lines(subpower$Sub_metering_2, col="red")
lines(subpower$Sub_metering_3, col="blue")
axis(side=1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1), 
       col=c("black","red","blue"), cex=0.5)

##bottom right graph
plot(subpower$Global_reactive_power, typ="l", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
axis(side=1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"))
