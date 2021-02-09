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

# add DateTime variables to DF (same as in plot2.R)
DF_dt<-mutate(DF,DateTime=as.POSIXct(paste(DF$Date,DF$Time,sep=""),format="%Y-%m-%d %H:%M"))
head(DF_dt$DateTime)

# plotting and add annotation
with(DF_dt,{plot(DateTime,Sub_metering_1,ylab="Energy Sub Metering",type="l",xlab="");
        lines(DateTime,Sub_metering_2,type="l",col="red");
        lines(DateTime,Sub_metering_3,type="l",col="blue")})
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))