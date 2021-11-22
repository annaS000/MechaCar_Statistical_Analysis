# **MechaCar Statistical Analysis**

## **Overview**
> This project is a statistical analysis of AutosRUs’ newest prototype, the MechaCar, that is currently experiencing production issues deterring the manufacturing team’s progress. Upper management has asked the data analytics team to review the production data for insights such as the following:
>* Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
>* Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
>* Run t-tests to determine if the manufacturing lots are statistically different from the mean population
>* Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. For each statistical analysis, you’ll write a summary interpretation of the findings.


---

## **Data Used**

[MechaCar_mpg.csv](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/resources/MechaCar_mpg.csv)

[Suspension_Coil.csv](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/resources/Suspension_Coil.csv)

---
## **R Script**
[MechaCarChallenge.R](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/MechaCarChallenge.R)

---

## **Linear Regression to Predict MPG**

![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/regression.png?raw=true)

* Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
    * vehicle length  
    * ground clearance

* Is the slope of the linear model considered to be zero? Why or why not?
    The p-Value is less than equal to 0.05 so we reject our null hypothesis and accept the alternative hypothesis that the slope is not zero. 

* Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

    The r-square value is equal to 0.7149 meaning about 71% of the data can be explained by the the regression line.

---

## **Summary Statistics on Suspension Coils**
![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/summary.png?raw=true)

![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/lot_summary.png?raw=true)

* The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?
    The variance for all three lots meet the design specifications with a variance of 62.29. Lot 1 and Lot 2 pass with variances of 0.98 and 7.47 respectively. Lot 3 fails the specifications with a variance of 170.29.

---

## **T-Tests on Suspension Coils**
![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/t_test.png?raw=true)
>H0: μ = 1500
Ha: μ ≠ 1500
The p-value is greater than alpha = 0.05, therefore we fail to reject the null hypothesis that the mean PSI is equal to 1500 which means we cannot rule out this as the true value for the population mean. Additionally, the 95% Confidence interval contains the value 1500 which also confirms we cannot rule out this value.
### Lot 1
![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/lot1_t_test.png?raw=true)
> H0: μ = 1500
Ha: μ ≠ 1500
The p-value is greater than alpha = 0.05, therefore we fail to reject the null hypothesis that the mean PSI is equal to 1500 which means we cannot rule out this as the true value for the population mean. Additionally, the 95% Confidence interval contains the value 1500 which also confirms we cannot rule out this value.
### Lot 2
![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/lot2_t_test.png?raw=true)
> H0: μ = 1500
Ha: μ ≠ 1500
The p-value is greater than alpha = 0.05, therefore we fail to reject the null hypothesis that the mean PSI is equal to 1500 which means we cannot rule out this as the true value for the population mean. Additionally, the 95% Confidence interval contains the value 1500 which also confirms we cannot rule out this value.

### Lot 3
![](https://github.com/annaS000/MechaCar_Statistical_Analysis/blob/main/images/lot3_t_test.png?raw=true)
> H0: μ = 1500
Ha: μ ≠ 1500
The p-value is less than alpha = 0.05, therefore we reject the null hypothesis that the mean PSI is equal to 1500 which means we will accept the alternative hypothesis that the population mean for PSI is not equal to 1500. Additionally, the 95% Confidence interval contains the value 1500 which also confirms we cannot rule out this value.

---

## Study Design: MechaCar vs Competition

* A statistical study that can quantify how the MechaCar performs against the competition could be asking randomly selected car owners who drive about 1,000 miles per month (two groups would be chosen: those who own the MechaCar and those who own a competitor model) to take a surveys to tell us how much they spent out of pocket for maintenance and repairs on their car during the previous year. Once this data is collected, we can compare the average costs for each group.

* What metric or metrics are you going to test?
We would be testing the average costs for maintenance repairs.

* What is the null hypothesis or alternative hypothesis?
It is expected that those who drive about 1,000 miles per month and own the MechaCar should have a lower average in total maintenance costs throughout the year.

* What statistical test would you use to test the hypothesis? And why?
We would use a two sample t-test to compare the average costs because the two groups being tested are independent from each other.

* What data is needed to run the statistical test?
The data that is needed from each group for this test would be
* Model of car
* Year of model
* Average miles driven per month
* Total cost for maintenance and repairs



