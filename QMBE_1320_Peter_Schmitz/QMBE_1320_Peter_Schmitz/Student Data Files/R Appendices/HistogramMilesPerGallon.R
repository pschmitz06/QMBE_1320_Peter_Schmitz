suv_df <- read.csv("CompactSUV.csv")
View(suv_df)
hist(suv_df$Overall.Miles.Per.Gallon, main = "Null",xlab= "Overall Miles Per Gallon")