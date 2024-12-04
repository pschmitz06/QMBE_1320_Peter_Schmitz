#install necessary packages if not previously installed
# install.packages("TTR")

# activate necessary libraries
library(TTR)

# forecasting with moving average, exponential smoothing, liner trend, quadratic trend, and exponential trend models


# performing a moving average forecast

# read in data file from working directory into a data frame
gasoline_df <- read.csv("Gasoline.csv")
View(gasoline_df)

# create a vector of gasoline sales
gasoline_sales <- gasoline_df$Sales

# perform a three-week moving average
gas_ma3 <- SMA(gasoline_sales, n=3)
print(gas_ma3)



# performing an exponential smoothing forecast

# create a vector of gasoline sales
gasoline_sales <- gasoline_df$Sales

# perform an exponential smoothing forecast
gas_ema.2 <- EMA(gasoline_sales, n=1, ratio = .2)
print(gas_ema.2)



# performing a linear trend forecast

# read in data file from working directory into a data frame
bicycle_df <- read.csv("Bicycle.csv")
View(bicycle_df)

# perform a linear regression for linear tend
bicycle_slr <- lm(Sales ~ Year, data = bicycle_df)
summary(bicycle_slr)



# performing a quadratic trend forecast

# read in data file from working directory into a data frame
cholest_df <- read.csv("Cholesterol.csv")
View(cholest_df)


# create a new variable that is the year squared
Year_sqrd <- cholest_df$Year*cholest_df$Year

# perform a linear regression for quadratic trend
cholest_slr <- lm(Revenue ~ Year + Year_sqrd, data = cholest_df)
summary(cholest_slr)



# performing an exponential trend forecast

# read in data file from working directory into a data frame
cholest_df <- read.csv("Cholesterol.csv")
View(cholest_df)

# create a new variable that is the natural logarithm of Revenue
ln_revenue <- log(cholest_df$Revenue)

# perform a linear regression for exponential trend
cholest_slr <- lm(ln_revenue ~ Year, data = cholest_df)
summary(cholest_slr)
