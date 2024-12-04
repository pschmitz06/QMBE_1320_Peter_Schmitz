# read in data file from working directory into a data frame
butler_with_deliveries_df <- read.csv("ButlerWithDeliveries.csv")
View(butler_with_deliveries_df)

# estimate the multiple linear regression model
butler_MLR <- lm(Time ~ Miles + Deliveries, data= butler_with_deliveries_df)
summary(butler_MLR)

# calculate the predicted values and the residuals and plot the residuals against the predicted values and the residuals against the independent variable
butler.pred=predict(butler_MLR)
butler.res=resid(butler_MLR)
plot(butler.pred,butler.res,ylab="Residuals",xlab="Predicted Values",main="Plot of Residuals vs. Predicted Values")
plot(butler_with_deliveries_df$Miles,butler.res,ylab="Residuals",xlab="Miles",main="Plot of Residuals vs. Miles")
plot(butler_with_deliveries_df$Deliveries,butler.res,ylab="Residuals",xlab="Deliveries",main="Plot of Residuals vs. Deliveries")

# calculate the standardized residuals and create a normal probability plot

butler.stdres=rstandard(butler_MLR)
qqnorm(butler.stdres,ylab="Standardized Residuals",xlab="Normal Scores",main=" Normal Probability Plot of Standardized Residuals")
list(butler.stdres)

# identifying possible outliers
butler.stdres[abs(butler.stdres) > 2]

# calculate the leverage values
hatvalues(butler_MLR)

# identifying any observations with large leverage values
hatvalues(butler_MLR)[hatvalues(butler_MLR) > 0.03]
                      
# calculate the Cook's D statistic
cooks.distance(butler_MLR)

# identifying any observations with large Cook's D statistic values
cooks.distance(butler_MLR)[cooks.distance(butler_MLR) > 1]

# calculate the confidence and prediction intervals for a new observation

newdata=data.frame(Miles=85,Deliveries=3)
predict(butler_MLR,newdata,interval="confidence",level=0.95)
predict(butler_MLR,newdata,interval="prediction",level=0.95)
new_butler_df<-read.csv("NewButler.csv")
predict(butler_MLR,new_butler_df,interval="confidence",level=0.95)
predict(butler_MLR,new_butler_df,interval="prediction",level=0.95)
