# Load packages

library(readr)
library(lubridate)
library(dplyr)

# Clean data (same as in plot1.R)
df<-read_delim("./household_power_consumption.txt",delim=";",na="?",col_types = "ctddddddd")
df$Date<-dmy(df$Date)
DF<-df %>%
        filter(Date>=as.Date('2007-02-01')&Date<=as.Date('2007-02-02'))
head(DF)
tail(DF)
str(DF)
dim(DF)
names(DF)

# add DateTime variables to DF
DF_dt<-mutate(DF,DateTime=as.POSIXct(paste(DF$Date,DF$Time,sep=""),format="%Y-%m-%d %H:%M"))
head(DF_dt$DateTime)

# make 
plot(DF_dt$DateTime,DF_dt$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab=" ")

# save png file
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()