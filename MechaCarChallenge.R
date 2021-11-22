#libraries
library(dplyr)
library(ggplot2)

#==========================================================================================================================================
#read csv files

#mechacar_mpg
mecha <- read.csv(file="~/Desktop/data/repos/MechaCar_Statistical_Analysis/resources/MechaCar_mpg.csv")

#suspension_coil
coil <- read.csv(file="~/Desktop/data/repos/MechaCar_Statistical_Analysis/resources/Suspension_Coil.csv")

#==========================================================================================================================================
#deliverable 1

#multiple linear regression
reg <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, mecha)
summary(reg)

#Residuals:
#Min       1Q       Median    3Q      Max 
#-19.4701  -4.4994  -0.0692   5.4433  18.5849

#Coefficients:
#                    Estimate   Std. Error  t value Pr(>|t|)    
#  (Intercept)      -1.040e+02  1.585e+01  -6.559   5.08e-08 ***
#  vehicle_length    6.267e+00  6.553e-01   9.563   2.60e-12 ***
#  vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
#  spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
#  ground_clearance  3.546e+00  5.412e-01   6.551   5.21e-08 ***
#  AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
#---
#signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 8.774 on 44 degrees of freedom
#Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
#F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

#r-squared value
summary(reg)$r.squared
#0.7149033

#==========================================================================================================================================
#deliverable 2

#PSI summary
total_summary <- coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
total_summary

# Mean      Median      Variance      SD
# 1498.78   1500        62.29356      7.892627

#lot summary
lot_summary <- coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI),Variance = var(PSI), SD = sd(PSI))
lot_summary
# Manufacturing_Lot  Mean  Median  Variance  SD
# Lot1               1500  1500    0.980     0.990
# Lot2               1500  1500    7.47      2.73 
# Lot3               1496  1498    170       13.0

#==========================================================================================================================================
#deliverable 3

# t-test all lots
t.test(coil$PSI, mu = 1500)

#	One Sample t-test

#data:  coil$PSI
#t = -1.8931, df = 149, p-value = 0.06028
#alternative hypothesis: true mean is not equal to 1500
#95 percent confidence interval:
#  1497.507 1500.053
#sample estimates:
#  mean of x 
#1498.78 

#lot subsets
lot1 = subset(coil, Manufacturing_Lot == 'Lot1')
lot2 = subset(coil, Manufacturing_Lot == 'Lot2')
lot3 = subset(coil, Manufacturing_Lot == 'Lot3')

#t-test for each lot
t.test(lot1$PSI, mu = 1500) 

#data:  lot1$PSI
#t = 0, df = 49, p-value = 1
#alternative hypothesis: true mean is not equal to 1500
#95 percent confidence interval:
#  1499.719 1500.281
#sample estimates:
#  mean of x 
#  1500 

t.test(lot2$PSI, mu = 1500)

#data:  lot2$PSI
#t = 0.51745, df = 49, p-value = 0.6072
#alternative hypothesis: true mean is not equal to 1500
#95 percent confidence interval:
#  1499.423 1500.977
#sample estimates:
#  mean of x 
#  1500.2 


t.test(lot3$PSI, mu = 1500)

#data:  lot3$PSI
#t = -2.0916, df = 49, p-value = 0.04168
#alternative hypothesis: true mean is not equal to 1500
#95 percent confidence interval:
#  1492.431 1499.849
#sample estimates:
#  mean of x 
#  1496.14 

#==========================================================================================================================================
#additional tests

#list columns for each file

attributes(mecha)
#columns: "vehicle_length", "vehicle_weight",
#"spoiler_angle", "ground_clearance", "AWD", "mpg"

#correlation matrix
matrix <- as.matrix(mecha[,c('vehicle_length','vehicle_weight','spoiler_angle','ground_clearance','AWD')])
cor(matrix)

attributes(coil)
#columns: "VehicleID", "Manufacturing_Lot", "PSI"

#correlation matrix
matrix <- as.matrix(mecha[,c("VehicleID", "Manufacturing_Lot", "PSI")]) 

#Absolute Value of r	Strength of Correlation
#r < 0.3	None or very weak
#0.3 ??? r < 0.5	Weak
#0.5 ??? r < 0.7	Moderate
#r ??? 0.7	Strong

# Determine the p-value using ANOVA
oneway <- aov(PSI ~ factor(Manufacturing_Lot), data=coil)
summary(oneway)

#                           Df Sum Sq Mean Sq F value Pr(>F)  
#factor(Manufacturing_Lot)   2    524  261.86   4.395  0.014 *
#  Residuals                 147   8758   59.58                 
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

TukeyHSD(oneway)
par(las=2)
par(mar=c(10,12,5,5))
plot(TukeyHSD(oneway))

#residual plot
res <- resid(reg)
ggplot(mecha,aes(fitted(reg),res), color = class) + 
  geom_point()+theme_minimal()
abline(0,0)

#qqplot
qqnorm(res, ylab = "Residuals")
qqline(res)