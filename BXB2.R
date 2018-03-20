#sujith cheedella (14MT30009)
#IIT KHARAGPUR
#BXBD Data science challenge 2018

library(readr)
library(ggplot2)
library(tseries)
library(forecast)

#import data set
Train_data <- read_csv("H:/BXB/Train_data.csv")
View(Train_data)

#creating a time series object from the train data
#feature_engineering
IssuesInMonth <- ts(Train_data$IssuesInMonth, start = c(2007,7), end = c(2017,6), frequency = 12)
summary(IssuesInMonth)

#plot time series#
#estimating of linear trend
plot(IssuesInMonth)
abline(reg=lm(IssuesInMonth~time(IssuesInMonth)))

#year on year trend 
plot(aggregate(IssuesInMonth, FUN = mean))

#box plot across all months 
boxplot(IssuesInMonth~cycle(IssuesInMonth)) 

#decomposing seasonal data and removing the seasonality
decomp<- stl(IssuesInMonth, s.window = "periodic", t.window = 15)
deseasonal_cnt <- seasadj(decomp)
plot(decomp)


#stationarize the series
# we need to remove the unequal variance this can be done by applying log to the series
# We also need to check the trend component, we can do this by applying the difference of series
#first difference

count_d1 <- diff(log(deseasonal_cnt), differences = 1)
plot(count_d1)
abline(reg = lm(count_d1~time(count_d1)))

#As we have seen that the mean is not same over the period of time. We go for the second difference

count_d2 <- diff(log(deseasonal_cnt), differences = 2)
plot(count_d2)
abline(reg = lm(count_d2~time(count_d2)))

#Dickey fuller test
adf.test(count_d2, alternative = "stationary", k=4)

#auto ARIMA function to get values of p,q for which AIC AICc BIC values are least
auto.arima(log(deseasonal_cnt), seasonal = FALSE, allowdrift = FALSE)

#fitting the ARIMA model
fit2 <- arima(log(deseasonal_cnt), order = c(2,2,2))
tsdisplay(residuals(fit2), lag.max = 45, main = "(2,2,2) model residuals")

#prediction for the next six months
pred <- predict(fit2, n.ahead = 6)
pred1 <- 2.718 ^pred$pred #'2.718' is because we have taken log in the model
pred1 




