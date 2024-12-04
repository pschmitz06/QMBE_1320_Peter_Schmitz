major_salaries_df <- read.csv("MajorSalaries.csv")
boxplot(Monthly.Starting.Salary.... ~ Major,
        data = major_salaries_df,
        xlab = "Business Major",
        ylab = "Monthly Starting Salary ($)")