suv_df <- read.csv("CompactSUV.csv")
View(suv_df)
str(suv_df)
suv_df$Owner.Satisfaction <- ordered(suv_df$Owner.Satisfaction, levels=c("-","0","+","++"))
entry73 <- suv_df[7,3]
entry73
class(entry73)
row7 <- suv_df[7,]
row7
class(row7)
col3 <- suv_df[,3]
col3
class(col3)