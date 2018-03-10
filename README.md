# BXBD-data-science-challenge 2018/ sujith cheedella
# creating the time series object
# analyzing the time series by year on year trend and also box plot
# decomposing the time series into seasonal trend and remainder components 
# Removing the seasonality
# Mean of the time series is to be constant for making any further modeling on time series. (i.e., stationarizing the time series)
# The stationarizing is done by differenciating the time series twice in this case 
# AR I MA model requires the value of p, d, q respectively to fit the model
# as we are twice differenciating we get the d value to be 2 (i.e., d=2)
# using auto.arima we find the values of p, q which corresponds to the lowest AIC AICc and BIC values
# Finally developed the model using the p,d,q values obtained and predicted the result for the next 6 months.
