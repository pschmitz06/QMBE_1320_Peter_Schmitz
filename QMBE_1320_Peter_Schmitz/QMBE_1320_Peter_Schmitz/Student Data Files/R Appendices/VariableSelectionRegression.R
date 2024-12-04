# install packages if not previously installed
# install.packages("olsrr")

# active necessary library packages
library(olsrr)


# read in data file from working directory into a data frame
cravens_df <- read.csv("Cravens.csv")
View(cravens_df)

# estimate the full multiple linear regression model
cravens_mod <- lm(Sales~ ., data=cravens_df)

# estimate the stepwise linear regression model
ols_step_both_p(cravens_mod, pent=.05, prem=.05)

# estimate the forward selection linear regression model
ols_step_forward_p(cravens_mod, pent = .05)

# estimate the backward selection linear regression model
ols_step_backward_p(cravens_mod, prem = .05)

# estimate the best subsets linear regression model
ols_step_best_subset(cravens_mod)
