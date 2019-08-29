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


### plotting
hist(mydata$Global_active_power, col = "red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()
