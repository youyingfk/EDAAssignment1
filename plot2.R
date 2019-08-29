### loading the data 
mydata <- read.table("C:/Users/yin.you/Documents/R Coursera/exdata_data_household_power_consumption/household_power_consumption.txt", 
                     sep = ";",header = TRUE,stringsAsFactors = FALSE)
head(mydata)
str(mydata)

### formatting the data 
data$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")
head(mydata)
nums <- c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2")
mydata[nums] <- lapply(mydata[nums],as.numeric)

datetime <- paste(mydata$Date, mydata$Time)
mydata$Datetime <- as.POSIXct(datetime)


### plotting
plot(mydata$Global_active_power~mydata$Datetime,type = "l",ylab ="Global Active Power (kilowatts)",xlab ="")
dev.copy(png, file="plot2.png")
dev.off()
