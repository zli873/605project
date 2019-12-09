rm(list=ls())
args = (commandArgs(trailingOnly=TRUE))
loc<-as.character(args[1])
pressure<-1:25
temperature<-1:25
humidity<-1:25
P1<-1:25
P2<-1:25
i<-1
for (year in 2017:2019) {
  if(year==2017){
    for (month in c("07","08","09","10","11","12")) {
      x<-read.csv(paste0("bmedata/",as.character(year),"-",as.character(month),"-loc-",loc,".csv"),header = F)
      pressure[i]<-mean(as.matrix(x)[,2],na.rm = T)
      temperature[i]<-mean(as.matrix(x)[,3],na.rm = T)
      humidity[i]<-mean(as.matrix(x)[,4],na.rm = T)
      y<-read.csv(paste0("sdsdata/",as.character(year),"-",as.character(month),"-loc-",loc,".csv"),header = F)
      P1[i]<-mean(as.matrix(y)[,2],na.rm = T)
      P2[i]<-mean(as.matrix(y)[,3],na.rm = T)
      i<-i+1
    }
  }
  if(year==2018){
    for (month in c("01","02","03","04","05","06","07","08","09","10","11","12")) {
      x<-read.csv(paste0("bmedata/",as.character(year),"-",as.character(month),"-loc-",loc,".csv"),header = F)
      pressure[i]<-mean(as.matrix(x)[,2],na.rm = T)
      temperature[i]<-mean(as.matrix(x)[,3],na.rm = T)
      humidity[i]<-mean(as.matrix(x)[,4],na.rm = T)
      y<-read.csv(paste0("sdsdata/",as.character(year),"-",as.character(month),"-loc-",loc,".csv"),header = F)
      P1[i]<-mean(as.matrix(y)[,2],na.rm = T)
      P2[i]<-mean(as.matrix(y)[,3],na.rm = T)
      i<-i+1
    }
  }
  if(year==2019){
    for (month in c("01","02","03","04","05","06","07")) {
      x<-read.csv(paste0("bmedata/",as.character(year),"-",as.character(month),"-loc-",loc,".csv"),header = F)
      pressure[i]<-mean(as.matrix(x)[,2],na.rm = T)
      temperature[i]<-mean(as.matrix(x)[,3],na.rm = T)
      humidity[i]<-mean(as.matrix(x)[,4],na.rm = T)
      y<-read.csv(paste0("sdsdata/",as.character(year),"-",as.character(month),"-loc-",loc,".csv"),header = F)
      P1[i]<-mean(as.matrix(y)[,2],na.rm = T)
      P2[i]<-mean(as.matrix(y)[,3],na.rm = T)
      i<-i+1
    }
  }
}
dat<-data.frame(P1,P2,pressure,temperature,humidity)
lm1<-lm(P1~pressure+temperature+humidity,data = dat)
summary(lm1)
lm2<-lm(P2~pressure+temperature+humidity,data = dat)
summary(lm2)
save(lm1, file = paste0(loc, "-lm1.RData"))
save(lm2, file = paste0(loc, "-lm2.RData"))