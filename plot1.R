##Read in data

power <- read.table("C:...household_power_consumption.txt",sep=";",header=T)

## Convert dates from factor format to date format

power$Date <- as.Date(power$Date, "%d/%m/%Y")

## subset dataset from 02/01/2007 and 02/02/2007

powersub <- subset(power, Date == "2007-02-01")
powersub2 <- subset(power, Date == "2007-02-02")
subpower<- rbind(powersub,powersub2)

## convert variable for graph into numeric format

subpower$Global_active_power <- as.numeric(as.character(subpower$Global_active_power))

###plot 1

hist(subpower$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",main="Global Active Power")
