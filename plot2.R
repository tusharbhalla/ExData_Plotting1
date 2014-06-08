##plot 2

##Read Data                        
raw_data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## Assign raw_data to temporary file
raw_data_temp = raw_data

## Convert Date column into Date format
raw_data_temp$Date = as.character(raw_data_temp$Date)
raw_data_temp$Date = as.Date(raw_data_temp$Date, format="%d/%m/%Y")
raw_data_temp$DateTime = paste(raw_data_temp$Date, raw_data_temp$Time) 
raw_data_temp$DateTime = strptime(raw_data_temp$DateTime, format="%Y-%m-%d %H:%M:%S")

## Retrieve the data between 2007-02-01 and 2007-02-02
raw_data_temp_1 = subset(raw_data_temp, Date <= "2007-02-02" & Date >= "2007-02-01")


##Create plot 2

png(filename = "plot2.png", width = 480, height = 480)
with(raw_data_temp_1, plot(DateTime, Global_active_power, type="l",
                           ylab="Global Active Power (kilowatts)",
                           xlab=""))

dev.off()