electronics_df <- read.csv("Electronics.csv")
number_commericals <- electronics_df$No..of.Commercials
sales_volume <- electronics_df$Sales.Volume
cov(number_commericals, sales_volume)
cor(number_commericals, sales_volume)