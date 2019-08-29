### loading the data 
mydata <- read.table("C:/Users/yin.you/Documents/R Coursera/exdata_data_household_power_consumption/household_power_consumption.txt", 
                     sep = ";",header = TRUE,stringsAsFactors = FALSE)
head(mydata)
str(mydata)

### formatting the data
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")
head(mydata)
nums <- c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2")
mydata[nums] <- lapply(mydata[nums],as.numeric)

datetime <- paste(mydata$Date, mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)

### Setting up multiple plots  
par(mfrow=c(2,2))

###plot 1
plot(mydata$Global_active_power~mydata$Datetime,type = "l",ylab ="Global Active Power",xlab ="")
###plot 2
plot(mydata$Voltage~mydata$Datetime,type = "l",ylab ="Voltage",xlab ="datetime")
###plot 3 
with(mydata, {
  plot(Sub_metering_1~Datetime,type = "l", ylab = "Energy sub metering")
  lines(Sub_metering_2~Datetime,col = "red")
  lines(Sub_metering_3~Datetime, col = "blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)
})
###plot 4
plot(mydata$Global_reactive_power~mydata$Datetime,type = "l",ylab ="Global_reactive_power",xlab ="datetime")

dev.copy(png, file="plot4.png")
dev.off()
