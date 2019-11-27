library(tidyverse)
sds1 <- read_csv("~/Documents/course/stat 605/605project/R code/2017-07_sds011sof.csv")
bme1 <- read_csv("~/Documents/course/stat 605/605project/R code/2017-07_bme280sof.csv")
library(xtable)
xtable(head(sof1))
xtable(head(bme1))

# stratified by sensor_id -------------------------------------------------

# example: 1022

s1022 <- sds[sds$sensor_id == 1022, ]
ts_sample <- cbind(s1022$P1, s1022$P2)
timeseries1022 <- ts(ts_sample)
timeseries1022
plot.ts(timeseries1022)
timeseriesdiff1 <- diff(timeseries1022, differences=1)
acf(timeseriesdiff1, lag.max=20)  


# stratified by location --------------------------------------------------

l1140b <- bme1[bme1$location == 1140,]
l1140s <- sds1[sds1$location == 1140,]
l <- min(c(dim(l1140b)[1], dim(l1140s)[1]))

data1 <- cbind(l1140b[1 : l, ], l1140s[1 : l, ])
model1 <- lm(data = data1, P1 ~ pressure + temperature + humidity)
summary(model1)
a <- model1$coefficients
 