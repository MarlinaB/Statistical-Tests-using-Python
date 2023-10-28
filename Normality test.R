#NORMAILTY TEST
# Install and load necessary packages 
library("dplyr")
library("ggpubr")

# Store the data in the variable my_data
my_data <- ToothGrowth
my_data
#Checking my data
set.seed(1234)
dplyr::sample_n(my_data,10)

#Case of large samples
#If the sample size is large enough (n>30), we can ignore the distribution 
#of the data and use parametric tests

#Visual methods
#1.Density Plot
#       It provides a visual judgement about whether the distribution 
#bell shaped.

library("ggpubr")
ggdensity(my_data$len,main="Density plot of the Tooth length"
          ,xlab="Tooth length")

#2.Q-Q plot:
#       It draws the correlation between a given sample and the
#normal distribution.
library("ggpubr")
ggqqplot(my_data$len)

#Normality tests
#      1.Kolmogorov-Smirnov test
#      2.Shapiro-Wilk"s test

#  The  null hypothesis of these tests is that "sampele distribution is 
#normal".If the test is significant, the distribution is non normal

###Null Hypothesis(H0): The data follows a normal distribution.##
##Alternative Hypothesis(H1): The data does not follow a normal distribution.##
shapiro.test(my_data$len)

#From the output, the p-value > 0.05 implying the distribution of the data
#are not significantly different from normal distribution.We can assume the 
#normality
