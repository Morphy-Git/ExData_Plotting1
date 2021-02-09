# Load packages

library(readr)
library(lubridate)
library(dplyr)

# Clean data
df<-read_delim("./household_power_consumption.txt",delim=";",na="?")
df$Date<-dmy(df$Date)
df$Time<-hms(df$Time)
DF<-df %>%
        filter(Date>=as.Date('2007-02-01')&Date<=as.Date('2007-02-02'))
head(DF)
tail(DF)
str(DF)
dim(DF)
names(DF)

# make histogram
png(file="plot1.png")
hist(DF$Global_active_power,main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")
dev.off()